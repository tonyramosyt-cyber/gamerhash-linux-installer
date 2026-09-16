# Validation and limits

## September 16 Create-admission maintenance revision

Package `0.1.0+mig3` combines the RTX Pro MIG-disabled and 64+ GiB RAM
admission repair with the targeted Create/UI correction. Release DEB SHA-256:

`a6c935462b90779baa64fc94dff763d5a3d9719266e29d0a6a70f47fa49dc48f`

The package contains daemon SHA-256
`ea568302cafae5430ab02862b7b6c1b4e073e6a6567f5be15861bedf90268243`
and desktop SHA-256
`0c7a1366c9f3c97bf269419df6e2cffda4f81a82aec970464a8e95ee0d346fee`.

The reproduced defect was an invalid capability path, not a failed Wan model
installation. The old Create catalog exposed every installed Video model as a
local text/image-to-video choice. Wan Animate and the video upscalers are
earning-only in the pinned client, so a Wan local request reached a worker route
that requires video and reference-image bytes, failed, retained a generation
state briefly, and delayed earning recovery.

The correction enforces the signed compatibility profile before Create reserves
the GPU or pauses earning. Earning-only Wan Animate, FlashVSR, and video
RealESRGAN entries are filtered from the local Video picker; direct unsupported
requests fail without starting generation. Model cards now distinguish local
Create from earning-only use. Image/video inputs can be removed and replaced,
and file-selection failures are shown instead of being silently discarded.

Verification completed:

- 15 focused daemon Create tests and 174 frontend tests passed.
- TypeScript checking and the production frontend build passed.
- Linux MIG/predecessor tests and the nominal-memory bridge test passed.
- The rebuilt startup hook matched its pinned immutable manifest.
- On Ubuntu 24.04 with an RTX PRO 6000, the live Video catalog exposed only the
  supported video-diffusion models. An unsupported Wan Create request returned
  `UNSUPPORTED_CAPABILITY` before GPU ownership, and earning remained enabled.
- The production native UI rendered the real signed-in dashboard after the
  corrected daemon and desktop binaries were installed.

This was a focused maintenance test on an existing authenticated host, not a
new clean-install run or a repeated 59-model matrix. The assembled `mig3` DEB,
signed manifest, scripts and checksums received package/static verification; the
complete new public command has not been rerun on another clean GPU machine.

## Current earning evidence — zero paid jobs

The RTX PRO 6000 worker is signed in, earning enabled and Ready, with 59/59
installed catalog models, seven installed LoRAs and Wan loaded. The vendor
reported 26 recommended earning models, seven LoRAs and zero skipped
requirements. Two TLS connections to `api.deapi.ai` exchanged traffic, and no
authentication, version, rate-limit, rejection, crash or timeout error appeared
after Ready.

No offer negotiation, generation, upload or payment acknowledgement was observed;
session job and earning counters remained zero. This means the local client is
healthy enough to wait for work, but it does **not** prove marketplace demand,
vendor-side routing/approval, or paid-job completion. A paid assignment cannot
be manufactured by the installer. Vendor-side dispatch records or a controlled
same-machine comparison with the current official Windows client would be needed
to distinguish no available assignment from silent vendor-side filtering.

The bundled vendor generation remains pinned to 0.85.4. GamerHash has published
newer Windows versions, but this observation contained no `OldVersion` response
or other definitive evidence that 0.85.4 was rejected. Version age is therefore
a hypothesis, not the stated cause of zero earnings.

## Prior fresh installation and login evidence

September 14: Ubuntu 24.04.5 AMD64, kernel 6.8.0-139, RTX 3060 12,288 MiB,
NVIDIA 580.178.04, approximately 24.46 GiB effective RAM, ext4.

- Signature-verified fresh package installation passed from an ordinary Ubuntu
  user session with sudo; the working NVIDIA driver was reused.
- First-start benchmark passed and released GPU resources.
- The installed app opened official GamerHash login in Ubuntu Firefox.
- The owner completed fresh credentials/CAPTCHA; no authenticated backup was used.
- Native service and dashboard showed `signed_in`.
- Live catalog returned 59 models and seven shared modules.
- One service restart preserved authentication and catalog access.
- Fresh earning remained paused and no GPU compute process remained afterward.

The rental host was headless and used a private test viewer. Normal Ubuntu
Desktop users do not need SSH, Xvfb, VNC or imported account state.

## Retained integrated application evidence

Earlier Ubuntu 24.04 / RTX 4070 integrated smoke passed Home/Settings,
catalog/install queue, one Gemma Chat response, one Sana Image, Gallery
preview/export, pause/resume, service restart and preservation of
settings/models/outputs. The separate qualification matrix records representative
runtime-family/model evidence; it was not rerun for this focused correction.

The RTX 3090 qualification previously completed one real paid marketplace job,
recorded the pending reward, released the GPU on pause and returned to Ready after
a service restart. That proves the Linux earning pipeline has completed a job on
one earlier qualified system; it does not guarantee a later account, model,
machine or marketplace interval will receive work.

## Public bundle and security checks

The public bootstrap uses anonymous HTTPS and a new immutable tag/cache namespace.
It pins the release public-key hash, verifies the detached RSA-3072/SHA-256
signature over `SHA256SUMS`, verifies every asset, validates release identity,
platform and expiry, then verifies the root-owned staging copy again before
executing privileged code.

The public bundle contains no development source/archive, private bootstrap,
credentials, account/cache state, model payloads or private signing key. Its
scripts received shell syntax checks; the model helper received a Python syntax
check; signature and checksum verification passed locally. Anonymous GitHub
download verification can only occur after publication and is not claimed here.

## Not guaranteed

- Automatic driver replacement, Secure Boot MOK/reboot and all-compatible bulk
  model downloads are implemented but remain unqualified paths.
- No blanket compatibility claim covers every GPU SKU, compositor, laptop,
  kernel or driver combination.
- Ubuntu 24.04 AMD64 only; 8 GB and other distributions remain unsupported.
- Vendor hardware admission, earning approval, routing, job availability and
  payment acknowledgement remain authoritative.
- RTX 3090 BEN2 background removal and Whisper Large V3 retain recorded limits.
- Human login, CAPTCHA/MFA, security enrollment and terms acceptance are unavoidable.

This is an independently developed demonstration beta, not an official GamerHash
Linux product or a fully consumer-certified release.
