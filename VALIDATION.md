# Validation and limits

## Verified application and installation

September 14: Ubuntu 24.04.5 AMD64, kernel 6.8.0-139, RTX 3060 12,288 MiB,
NVIDIA 580.178.04, approximately 24.46 GiB effective RAM, ext4.

- Signature-verified fresh package installation passed; required host runtime
  preparation passed from an ordinary Ubuntu user session with sudo.
- Existing working NVIDIA driver was reused. First-start benchmark passed.
- Actual installed app opened official GamerHash login in Ubuntu Firefox.
- Owner completed fresh credentials/CAPTCHA; no authenticated backup was used.
- Native service and dashboard showed signed_in.
- Live catalog returned 59 models and 7 shared modules.
- One service restart preserved signed_in and authenticated catalog access.
- Earning stayed paused; service healthy; zero GPU compute processes afterward.

The test used a private viewer because the rental host was headless. A normal
Ubuntu Desktop user does NOT need that viewer, SSH, Xvfb or VNC. Its initial test
session had to be corrected to use the ordinary user runtime, desktop activation
environment and normal Xauthority location. Firefox AppArmor was not weakened.

Package SHA-256:
`20d3e5648e0362bda35a59b010beefa70aa28ff654389a5e5b09ae94313fdd72`

## Retained integrated evidence

Earlier Ubuntu 24.04 / RTX 4070 integrated package smoke passed Home/Settings,
catalog/install queue, one Gemma Chat response, one Sana Image, Gallery
preview/export, pause/resume, service restart and preserved settings/models/outputs.
That earlier run used preserved authentication; the separate fresh-login run
above closes the native-authentication gap, not a new full model-matrix claim.
The September 14 frontend correction received 8 focused tests, type checking,
production build and installed runtime verification. Backend contracts and model
runtimes were unchanged. See SUPPORT_MATRIX.md for retained model qualification.

## Public download change

The public bootstrap replaces private GitHub CLI downloads with anonymous HTTPS.
The .deb, local installer and runtime preparation bytes are unchanged. The public
bundle omits development source and the private bootstrap, updates user documents,
and has a newly signed manifest using the same pinned public verification key.
Shell syntax and downloaded-file signature/checksum checks are focused checks;
they do NOT constitute another clean-machine execution of the public command.
No extra paid VM or full model matrix was used for publication.

## Not guaranteed

- Automatic driver replacement, Secure Boot MOK/reboot and all-compatible bulk
  model downloads are implemented but remain unqualified paths.
- No blanket claim of compatibility for every GPU SKU, Wayland/compositor setup,
  laptop configuration or kernel/driver combination.
- Ubuntu 24.04 AMD64 only; 8 GB and other distributions remain unsupported.
- Vendor admission and earning approval/job availability remain authoritative.
- RTX 3090 BEN2 background removal and Whisper Large V3 have recorded limitations.
- Human login, CAPTCHA/MFA, security enrollment and terms acceptance are unavoidable.

This is a demonstration beta, not a fully consumer-certified product.
