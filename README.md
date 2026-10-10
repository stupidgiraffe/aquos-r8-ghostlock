# Sharp AQUOS R8 (SH-R80) GhostLock Root

Verified device-support notes and kernel profile for the **Sharp AQUOS R8 SH-R80 (FaYuiry)** using [YuKongA/ghostlock-app](https://github.com/YuKongA/ghostlock-app) and a KernelSU late-load handoff.

> [!WARNING]
> This repository is **exact-build support**, not a universal Sharp R8 exploit package. Do not use the profile on a different kernel release or after an OTA unless the new kernel is independently validated.

## Verified target

| Field | Value |
|---|---|
| Model | Sharp AQUOS R8 SH-R80 |
| Device | FaYuiry |
| Android userspace | Android 16 / SDK 36 |
| Build | SC525 / 04.00.00 |
| Security patch | 2026-01-01 |
| Kernel | `5.15.178-android13-8-00025-g7feb0b0b7cd8-ab14134651` |
| Architecture | arm64 / aarch64 |
| GKI source commit | `7feb0b0b7cd82204ae4d1515e8a3cc3fc9f03529` |
| Android CI build | `14134651` |
| Bootloader | locked |
| AVB | green / locked |

The Android 16 system is paired with an Android 13 GKI/vendor stack. The exact running kernel maps to Google's public Android common GKI build above.

## What has been confirmed on real hardware

- GhostLock profile imports successfully.
- **Direct/base mode works.**
- CPU pair **3,4** worked on the tested device.
- Credential escalation reached **UID 0**.
- GhostLock's seccomp bypass completed.
- Official **KernelSU late-load handoff succeeded**.
- Bootloader unlock was **not** required.
- No boot image was flashed or patched.

The initial Shizuku/UserService path disconnected after the W1 stage. Direct mode was the successful path and is the recommended path for this exact target.

## Quick use

1. Install current GhostLock from upstream.
2. Install the current official KernelSU manager.
3. Import [the verified profile](profiles/5.15.178-android13-8-00025-g7feb0b0b7cd8-ab14134651.conf).
4. Run `scripts/check-target.sh` first. **Stop if it reports any mismatch.**
5. In GhostLock:
   - Run via Shizuku: **OFF**
   - Safe Mode: **OFF**
   - CPU pair: **3,4**
   - Keep debug/kernel logging enabled
6. Run once.
7. Open KernelSU and confirm it sees the live driver.
8. Verify with `scripts/root-status.sh`.

See [docs/ROOT-FLOW.md](docs/ROOT-FLOW.md) for the exact known-good flow.

## Important limitations

This is a **live late-load root path**. A full reboot removes the live KernelSU module; rerun GhostLock after boot to restore root. This repository does **not** currently attempt boot persistence or modify verified boot.

Firmware/kernel updates can invalidate offsets even when the phone still says SH-R80. The kernel release check is therefore mandatory.

## Why this repo exists

The goal is to keep the SH-R80-specific work small, reproducible, and upstreamable instead of maintaining a divergent exploit fork. The preferred long-term direction is:

- contribute the validated profile upstream;
- fix upstream extraction/symbol-recovery issues where appropriate;
- keep Sharp-specific verification, documentation and regression notes here.

## Upstream

- GhostLock: https://github.com/YuKongA/ghostlock-app
- KernelSU: https://github.com/tiann/KernelSU
- Google Android common: https://android.googlesource.com/kernel/common/

## Status

**Physical-device success confirmed for the exact target above.** Additional repeated cold-boot validation is still desirable before calling the profile broadly stable across multiple SH-R80 units.
