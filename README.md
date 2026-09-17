# GamerHash Linux — temporary public installer

Download-only demonstration beta for **Ubuntu 24.04 Desktop AMD64 and qualified
single NVIDIA RTX profiles starting at 12 GB VRAM**. This is independently
developed Linux compatibility, not an official GamerHash Linux release.

**[Start here: fresh Ubuntu setup instructions](QUICKSTART.md)**

- [Download the signed release](../../releases/tag/demo-0.1.0-20260917-earning-stability)
- [Hardware and model support](SUPPORT_MATRIX.md)
- [Exactly what was tested](VALIDATION.md)

Package `0.1.0+mig4` includes the RTX Pro MIG-disabled/64+ GiB admission repair,
the tested Create correction, and the accepted safe-boundary earning repair.
Ordinary competing-GPU, battery, and network pauses are deferred while a vendor
job is starting or generating; local Create waits for Ready/Idle before taking
the GPU. Hardware-safety stops remain immediate.

No GitHub account, SSH access, developer directories or imported GamerHash session
is required. You must sign in to GamerHash yourself in the Ubuntu browser. The
installer checks a pinned signing public key, release signature and checksums.
Fresh installations leave earning paused.

Focused RTX 4090 acceptance preserved six initial marketplace assignments,
proved Qwen Image Edit Plus NF4 across five sequential local operations, proved
the installed RealESRGAN Video x2/x4, FlashVSR and BGE runtimes locally, and
completed one post-fix credited WhisperLargeV3 marketplace job. This release
still does not promise future assignments or earnings; see VALIDATION.md.

This repository contains only public installation materials and binary release
assets. Development source/history remains private. No credentials, account
state, private signing keys, source archive or model payloads are included. Public
availability does not grant additional rights to third-party software; bundled
notices apply.

Availability is temporary and may be withdrawn. Downloads already obtained by
others cannot be recalled. This signed release expires December 31, 2026 UTC;
that is an installer security deadline, not an automatic repository privacy change.

Known limits include unqualified automatic driver/MOK replacement and bulk model
installation paths, model-specific vendor restrictions, and the issues listed in
the support matrix. **8 GB remains Planned and unsupported.**
