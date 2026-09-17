#!/usr/bin/env bash
# Pin this file's SHA-256 in the recipient command before executing it.
set -Eeuo pipefail
umask 077
readonly repo=tonyramosyt-cyber/gamerhash-linux-installer
readonly tag=demo-0.1.0-20260917-earning-stability
readonly key_sha=adb5897268f9a3b28f0dd95fdbd32227c45a32ca9eee71db0e062ef485c78c15
die() { printf 'Public installation: %s\n' "$*" >&2; exit 1; }
[[ $EUID != 0 ]] || die 'Run as your ordinary desktop user, not root. sudo will be requested for system changes only.'
[[ $# == 0 || ( $# == 1 && $1 == --all-compatible ) ]] || die 'Usage: bash install-public.sh [--all-compatible]'
[[ -r /etc/os-release ]] || die 'Only Ubuntu 24.04 AMD64 is supported.'
. /etc/os-release
[[ $ID == ubuntu && $VERSION_ID == 24.04 && $(uname -m) == x86_64 ]] || die 'Only Ubuntu 24.04 AMD64 is supported. No OS upgrade was attempted.'
[[ -d /run/systemd/system ]] || die 'A booted systemd host is required, not a container.'
sudo apt-get update
sudo apt-get install --yes ca-certificates curl jq openssl python3
cache="${XDG_CACHE_HOME:-$HOME/.cache}/gamerhash-linux-installer/public-$tag"
mkdir -p -- "$cache"
[[ ! -L $cache && $(stat -c %u "$cache") == "$UID" ]] || die 'Unsafe download cache.'
chmod 700 "$cache"
exec 8>"$cache/install.lock"
flock -n 8 || die 'Another download/install is running.'
download() {
  local file=$1 temp
  [[ $file =~ ^[A-Za-z0-9][A-Za-z0-9_.-]*$ ]] || die 'Unsafe release filename.'
  [[ ! -L $cache/$file ]] || die 'Symlink in release cache.'
  [[ ! -f $cache/$file ]] || return 0
  temp=$(mktemp -d "$cache/download.XXXXXX")
  # Anonymous HTTPS only. Completed verified files are reused on a rerun.
  curl --fail --location --proto "=https" --proto-redir "=https" --tlsv1.2 \
    --retry 3 --connect-timeout 20 --max-time 1800 \
    --output "$temp/$file" "https://github.com/$repo/releases/download/$tag/$file" || \
    die 'Public download failed or has been withdrawn. Rerun the same command; completed files are reused.'
  mv -- "$temp/$file" "$cache/$file"
  rmdir -- "$temp"
}
download release-signing-public.pem
[[ $(sha256sum "$cache/release-signing-public.pem" | cut -d' ' -f1) == "$key_sha" ]] || die 'Release signing key does not match the pinned trust root.'
download SHA256SUMS
download SHA256SUMS.sig
openssl dgst -sha256 -verify "$cache/release-signing-public.pem" -signature "$cache/SHA256SUMS.sig" "$cache/SHA256SUMS" >/dev/null || die 'Release signature verification failed. Nothing from the release was executed.'
files=()
while read -r hash file extra; do
  [[ $hash =~ ^[0-9a-f]{64}$ && $file =~ ^[A-Za-z0-9][A-Za-z0-9_.-]*$ && -z ${extra:-} ]] || die 'Malformed signed manifest.'
  [[ ! " ${files[*]} " == *" $file "* ]] || die 'Duplicate signed filename.'
  files+=("$file")
  if [[ -f $cache/$file && $(sha256sum "$cache/$file" | cut -d' ' -f1) != "$hash" ]]; then
    mv -- "$cache/$file" "$cache/$file.rejected.$(date +%s)"
  fi
  download "$file"
done < "$cache/SHA256SUMS"
(cd -- "$cache" && sha256sum --strict --check SHA256SUMS) || die 'A release checksum failed.'
for required in RELEASE.json install-gamerhash-linux.sh prepare-host.sh ghlinux-models gamerhash-linux_0.1.0_amd64.deb gamerhash-linux_0.1.0_amd64.deb.sha256; do
  [[ " ${files[*]} " == *" $required "* ]] || die "Signed release is missing $required."
done
jq -e --arg tag "$tag" '.schema == 1 and .tag == $tag and .os == "ubuntu-24.04-amd64" and .packageVersion == "0.1.0+mig4"' "$cache/RELEASE.json" >/dev/null || die 'Release identity or supported platform mismatch.'
expiry=$(jq -r .expiresUtc "$cache/RELEASE.json")
created=$(jq -r .createdUtc "$cache/RELEASE.json")
[[ $(date -u -d "$created" +%s) -le $(date -u +%s) && $(date -u +%s) -lt $(date -u -d "$expiry" +%s) ]] || die 'Release expired or system clock is wrong. Obtain a newly signed release; do not bypass verification.'
stage="/var/lib/gamerhash-linux-installer/$tag"
sudo install -d -o root -g root -m 0700 /var/lib/gamerhash-linux-installer "$stage"
for file in "${files[@]}" SHA256SUMS SHA256SUMS.sig release-signing-public.pem; do
  sudo install -o root -g root -m 0600 -- "$cache/$file" "$stage/$file"
done
# Verify the copied bytes before executing privileged release code.
sudo bash -c 'cd "$1" && openssl dgst -sha256 -verify release-signing-public.pem -signature SHA256SUMS.sig SHA256SUMS >/dev/null && sha256sum --strict --check SHA256SUMS' bash "$stage"
sudo bash "$stage/prepare-host.sh"
sudo bash "$stage/install-gamerhash-linux.sh" "$stage/gamerhash-linux_0.1.0_amd64.deb"
sudo install -o root -g root -m 0755 "$stage/ghlinux-models" /usr/local/bin/ghlinux-models
printf '\nInstallation complete. Fresh earning is paused. Launch as this desktop user:\ngamerhash-linux\n'
printf 'Sign in through the official browser. CAPTCHA, MFA, terms, and Secure Boot enrollment require you; no account state is imported.\n'
printf 'After login: ghlinux-models --all-compatible (or specify selected model:IDs).\n'
if [[ ${1:-} == --all-compatible ]]; then
  /usr/local/bin/ghlinux-models --all-compatible
fi
