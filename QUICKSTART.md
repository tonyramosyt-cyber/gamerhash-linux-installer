# Fresh Ubuntu 24.04 Desktop setup

This is an independently developed GamerHash Linux demonstration beta, not an
official GamerHash Linux product. Public downloads require no GitHub account.

## 1. Check your machine

- Ubuntu **24.04 LTS Desktop**, Intel/AMD 64-bit (`amd64` / `x86_64`), installed
  normally on disk. Not Ubuntu 22.04, ARM, WSL, a live USB session or a container.
- One NVIDIA RTX GPU with a matching Qualified signed profile and at least
  **12 GB usable VRAM**. 8 GB is not supported. Do not combine GPU memory.
- At least **16 GB effective system RAM**; 32 GB or more is preferable for larger
  workloads. Individual models can require more RAM/VRAM.
- **30 GiB free disk space minimum** for installation, plus model/output storage.
  Use an SSD and start with a few models rather than downloading the entire catalog.
- Internet access, a normal desktop user with sudo permission, and your own
  GamerHash account (or create one through the official UI).

Qualified boundary profiles start at 12 GB; the 16 GB Ada-or-newer/64 GB RAM,
24 GB Ampere-or-newer/32 GB RAM and 32 GB Blackwell profiles have their own recorded
qualification and limits. Check SUPPORT_MATRIX.md. Local Create eligibility is
separate from vendor earning approval; buying a compatible GPU does not guarantee
marketplace work or earnings.

## 2. Prepare the normal Ubuntu desktop

1. Finish Ubuntu installation and sign in to your ordinary desktop account.
2. Connect to the internet. Finish any already-running Software Updater operation
   and any reboot it requests before starting this installer.
3. Open Firefox once and finish any first-run screen. Close it afterward if desired.
4. Close games and other GPU workloads. Plug a laptop into AC power.
5. Open Terminal with **Ctrl+Alt+T**. Do not use a root shell or `sudo su`.

You can inspect the host with:

```bash
cat /etc/os-release
uname -m
free -h
df -h /
nvidia-smi
```

If `nvidia-smi` is missing or fails, the installer will attempt the matching Ubuntu
recommended driver, subject to the conditions below. Do not install an arbitrary
NVIDIA `.run` file or disable Secure Boot. For the manually managed, recommended
Ubuntu route, open **Software & Updates → Additional Drivers**, select the
hardware-recommended NVIDIA driver, apply it and reboot. This release requires a
working driver branch **570 or newer**. Ubuntu's driver guidance is at
https://ubuntu.com/desktop/docs/en/latest/how-to/graphics/install-nvidia-drivers/.

## 3. Download, verify and install — one command

Paste this entire block into Terminal. It is one `bash -c` command and keeps your
terminal available for sudo and any security prompts:

```bash
bash -c '
set -e
test "$EUID" -ne 0 || { echo "Run as your ordinary Ubuntu desktop user, not root."; exit 1; }
test -r /etc/os-release || { echo "Ubuntu 24.04 AMD64 required."; exit 1; }
. /etc/os-release
test "$ID:$VERSION_ID:$(uname -m)" = "ubuntu:24.04:x86_64" || { echo "Only Ubuntu 24.04 AMD64 is supported."; exit 1; }
sudo apt-get update
sudo apt-get install -y ca-certificates curl
d=$(mktemp -d)
curl --fail --location --proto "=https" --proto-redir "=https" --tlsv1.2 --retry 3 --connect-timeout 20 --max-time 180 -o "$d/install-public.sh" https://github.com/tonyramosyt-cyber/gamerhash-linux-installer/releases/download/demo-0.1.0-20260914/install-public.sh
printf "%s  %s\n" e35dacab2a3c23e58a785451425e7cc41b11574c9637c4ed301b97619d9c9491 "$d/install-public.sh" | sha256sum -c -
bash "$d/install-public.sh"
'
```

At a sudo password prompt, type your **Ubuntu login password**. No characters
appear while typing; press Enter. This is not your GamerHash password.

The command downloads the installer from the public release and pins its SHA-256.
Before running release code as root, the bootstrap checks the pinned RSA public
key, detached signature over SHA256SUMS, every release-file checksum, release
identity, platform and expiry. It verifies the root-owned staging copy again.
It installs named dependencies, the package and helper, enrolls this desktop user,
and starts the protected service safely. Fresh earning is paused.

Compatible existing drivers/browsers/libraries are reused. The installer does
not perform a whole-OS upgrade. No source archive, account state or model payload
is part of this download. Models are selected and downloaded separately.

### Driver changes and reboots

If the installer prints **Reboot required**, save your work and reboot normally.
After logging back into the desktop, rerun the exact same command above. Completed
verified downloads and driver-stage state are reused. Do not bypass a signature,
expiry, unsupported-driver or platform error. Check that the system clock is correct.

If Secure Boot requests a MOK password during driver installation, choose it
yourself. On reboot, use the firmware MOK manager's **Enroll MOK → Continue → Yes**
flow and enter that chosen password, then reboot. Screen wording can differ.
Do not disable Secure Boot. If driver loading still fails, use Ubuntu's Additional
Drivers interface/support rather than repeatedly forcing the installer.

Automatic driver replacement/MOK/reboot is implemented but not yet qualified in
the demonstration test. A working Ubuntu-managed NVIDIA driver is the tested path.
An incompatible manual `.run` installation is refused rather than overwritten.

## 4. Start and sign in

Run as the same ordinary desktop user, **without sudo**:

```bash
gamerhash-linux
```

In **Home → Sign in**, the official GamerHash page opens in the browser **on this
Ubuntu machine**. Enter your own credentials, complete CAPTCHA/MFA, and click Log
in. If an **app log in confirmation** page appears, click **Confirm**. Return to
the Linux app and wait for the account to appear as signed in. A website dashboard
alone is not proof that the app is authenticated.

If the attempt expires while you are entering credentials, return to Home and
choose **Start again**. Keep the browser signed in and approve the new desktop
attempt if asked. Do not paste old login URLs or send passwords/tokens to support.
If Ubuntu asks for the login keyring password, use the keyring/Ubuntu password,
not the GamerHash password; do not disable keyring protection.

No SSH, Mac, VNC, port forwarding or authenticated backup is needed on Ubuntu Desktop.

## 5. Install a small Chat and Image model first

Use **Models** to see the compatible live catalog and queue installation. Shared
dependencies are resolved automatically. Suggested demonstration starting models,
only when admitted by your actual live catalog:

```bash
ghlinux-models model:gemma_3_it_qat_1b_q4_k_m model:sanasprint06b1024
```

Wait for installation to finish. In **Create**, choose Chat/Gemma and ask a short
question. Then choose Image/Sana and generate a small image. Open the result in
**Create → Gallery** and export it using the native save dialog. Local Create
temporarily owns the GPU and pauses earning while it runs.

To preview a full compatible installation plan, then explicitly request it:

```bash
ghlinux-models --all-compatible --plan-only
ghlinux-models --all-compatible
```

Read the plan and disk requirement first. The helper selects only compatible,
live vendor-admitted entries and reserves twice the declared missing payload size
plus 5 GiB. It deduplicates shared modules and uses the resumable service queue.
Rerunning reuses installed models, active transfers and saved operations. A
per-model client wait timeout does not cancel the queue. Corrupt/vendor-failed
downloads may still need a retry. Bulk all-model installation is not a tested
guarantee. Larger models can need substantial RAM/swap and hundreds of GB of disk.
HiDream Full on a 12 GB GPU needs the recorded 31.5 GiB combined RAM/swap headroom;
start with smaller models if your machine lacks it. Swap does not raise hardware
earning eligibility.

## 6. Earning controls

Leave earning paused while testing Create. If you later want earning, use **Earn**
or these commands as your enrolled desktop user:

```bash
ghlinuxctl earning enable
ghlinuxctl earning pause
ghlinuxctl --json status
```

Vendor approval/wait-list status and job demand remain authoritative. A local-use
machine may be AI READY without being AI OPTIMAL or approved to earn. Earning
support never guarantees a paid assignment. Compatible local Create remains
separate. Laptop battery, games/competing GPU work, unsafe temperature and local
Create can pause earning. Authentication expiry requires human login again.

## 7. Status, recovery, upgrade and uninstall

```bash
ghlinuxctl --json status
ghlinuxctl --json catalog
ghlinuxctl --json install status
systemctl status gamerhash-linux.service --no-pager
journalctl -u gamerhash-linux.service --since "10 minutes ago" --no-pager
```

Check logs for private information before sharing. Never publish account tokens,
prompts or local/earning outputs. Do not expose service/model ports publicly.

For a stuck service after saving work:

```bash
sudo systemctl restart gamerhash-linux.service
```

Re-run this release's install command to reinstall its verified bytes. For a
future upgrade use that release's own URL and pinned bootstrap hash. Upgrades
preserve existing account/settings/model state and earning preference; unlike a
fresh install, an upgrade does not promise to reset earning to paused.

For a complete, already-downloaded signed release directory, this remains valid:

```bash
sudo bash install-gamerhash-linux.sh ./gamerhash-linux_0.1.0_amd64.deb
```

All signed companion files must remain together; the .deb alone is insufficient.

Remove the app while preserving managed data:

```bash
sudo apt remove gamerhash-linux
```

**Destructive:** to delete the package and managed model/account data instead,
export any outputs you need first, then use `sudo apt purge gamerhash-linux`.
The separate `/usr/local/bin/ghlinux-models` helper and installer caches are not
removed by package removal. Do not recursively delete broad home/system paths.

## Limits and temporary availability

Read SUPPORT_MATRIX.md and VALIDATION.md. Known RTX 3090 limitations include BEN2
and Whisper Large V3. Vendor-unavailable models are not forced. 8 GB and other
Linux distributions are not supported by this release. The tested host used an
X11 desktop session; no blanket Wayland/compositor qualification is claimed.
If rendering/browser launch fails, first confirm Firefox opens normally and the
desktop has a default browser; do not disable its sandbox.

The public installer may be withdrawn; copies already downloaded cannot be
recalled. This signed release expires December 31, 2026 UTC. Its public availability
does not change the project into an officially supported or consumer-certified product.
