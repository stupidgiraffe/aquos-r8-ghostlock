<div align="center">

# Sharp AQUOS R8 (SH-R80) GhostLock Root

**Verified GhostLock → KernelSU root path for the Sharp AQUOS R8 SH-R80 (FaYuiry).**

[![Verified device](https://img.shields.io/badge/device-SH--R80-2ea44f?style=flat-square)](https://github.com/stupidgiraffe/aquos-r8-ghostlock)
[![Android](https://img.shields.io/badge/Android-16-3DDC84?style=flat-square&logo=android&logoColor=white)](https://github.com/stupidgiraffe/aquos-r8-ghostlock)
[![Kernel](https://img.shields.io/badge/kernel-5.15.178-555?style=flat-square)](https://github.com/stupidgiraffe/aquos-r8-ghostlock)
[![GhostLock PR](https://img.shields.io/badge/upstream-PR%20%23381-blue?style=flat-square)](https://github.com/YuKongA/ghostlock-app/pull/381)
[![Release](https://img.shields.io/github/v/release/stupidgiraffe/aquos-r8-ghostlock?style=flat-square)](https://github.com/stupidgiraffe/aquos-r8-ghostlock/releases/latest)

</div>

> [!WARNING]
> This is **exact-kernel support**, not a universal Sharp R8 exploit package. Do not use the bundled profile on a different `uname -r` or after an OTA until that kernel has been independently validated.

## Verified on real hardware

This profile has completed the full chain on a physical **Sharp AQUOS R8 SH-R80**:

- GhostLock direct/base-mode exploitation
- credential escalation to **UID 0**
- seccomp bypass
- fixed CPU pair **3,4**
- official **KernelSU Android13-5.15 LKM late-load**
- locked bootloader / AVB green retained
- no patched or flashed boot image required

<p align="center">
  <img src="docs/images/ghostlock-supported.jpg" alt="GhostLock reporting the SH-R80 profile as supported" width="42%">
  &nbsp;&nbsp;
  <img src="docs/images/kernelsu-working.jpg" alt="KernelSU working in jailbreak mode on the SH-R80" width="42%">
</p>

<p align="center"><sub>Left: GhostLock recognizes the exact SH-R80 profile. Right: KernelSU reports a working LKM jailbreak session on the same kernel.</sub></p>

## Exact verified target

| Field | Verified value |
|---|---|
| Model | **Sharp AQUOS R8 SH-R80** |
| Device | `FaYuiry` |
| Android | **16 / SDK 36** |
| Build | **SC525 / 04.00.00** |
| Security patch | **2026-01-01** |
| Kernel | `5.15.178-android13-8-00025-g7feb0b0b7cd8-ab14134651` |
| Architecture | arm64 / aarch64 |
| GKI commit | `7feb0b0b7cd82204ae4d1515e8a3cc3fc9f03529` |
| Android CI build | `14134651` |
| Bootloader | locked |
| AVB | green / locked |

The Android 16 userspace is paired with an Android 13 GKI/vendor stack. The running kernel maps to Google's public Android common GKI build above.

## Quick start

1. Install the current [GhostLock](https://github.com/YuKongA/ghostlock-app) build.
2. Install the current [KernelSU](https://github.com/tiann/KernelSU) manager.
3. Import the [verified SH-R80 profile](profiles/5.15.178-android13-8-00025-g7feb0b0b7cd8-ab14134651.conf).
4. Run `scripts/check-target.sh`. **Stop on any mismatch.**
5. In GhostLock use:
   - **Run via Shizuku: OFF**
   - **Safe Mode: OFF**
   - **CPU pair: 3,4**
   - debug/kernel logging enabled
6. Run GhostLock once.
7. Open KernelSU and confirm the live LKM is recognized.
8. Verify with `scripts/root-status.sh`.

For the full known-good sequence, see **[ROOT-FLOW.md](docs/ROOT-FLOW.md)**.

## Why direct mode

An earlier Shizuku/UserService attempt disconnected after W1. Direct/base mode subsequently completed the entire exploit and KernelSU handoff, so this exact target ships with:

```text
recommend_shizuku = 0
```

## Reboot behavior

This route **late-loads KernelSU into the running kernel**. It does not patch or flash boot.

After a full reboot, expect the live KernelSU module to be gone until GhostLock is run again.

## Kernel provenance & extractor finding

The exact GKI provenance, Google CI build mapping, and the GhostLock embedded-symbol recovery false-negative we found are documented in **[KERNEL-PROVENANCE.md](docs/KERNEL-PROVENANCE.md)**.

The profile has also been submitted upstream:

**[YuKongA/ghostlock-app PR #381 — Add verified Sharp AQUOS R8 SH-R80 5.15.178 profile](https://github.com/YuKongA/ghostlock-app/pull/381)**

## Repository contents

- `profiles/` — verified exact-kernel GhostLock profile
- `scripts/check-target.sh` — fail-closed device/kernel guard
- `scripts/root-status.sh` — root / KernelSU status check
- `docs/ROOT-FLOW.md` — known-good execution sequence
- `docs/KERNEL-PROVENANCE.md` — exact GKI provenance and extractor notes
- `docs/UPSTREAM.md` — upstream contribution notes
- `SECURITY.md` — safety and reporting guidance

## Support

If this work saved you time or helped with SH-R80 research, you can support future projects here:

<a href="https://buymeacoffee.com/stupidgiraffe">
  <img src="https://img.shields.io/badge/Buy%20me%20a%20coffee-support-FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=000000" alt="Buy Me a Coffee">
</a>

## Credits

This project builds on the work of:

- [YuKongA/ghostlock-app](https://github.com/YuKongA/ghostlock-app)
- [tiann/KernelSU](https://github.com/tiann/KernelSU)
- [Google Android common kernel](https://android.googlesource.com/kernel/common/)

---

**Status: verified on physical SH-R80 hardware for the exact build/kernel listed above.**
