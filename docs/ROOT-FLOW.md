# Known-good SH-R80 root flow

This documents the flow that succeeded on the tested Sharp AQUOS R8 SH-R80.

## Preconditions

The exact target must match:

```text
SHARP/SH-R80/FaYuiry:16/SC525/04.00.00:user/release-keys
5.15.178-android13-8-00025-g7feb0b0b7cd8-ab14134651
```

Run:

```sh
sh scripts/check-target.sh
```

Do not continue on a mismatch.

## Apps

- GhostLock: current YuKongA upstream build
- Kernel manager: official KernelSU

Opening KernelSU before the live module exists may show not installed/unsupported. That is expected.

## GhostLock settings that worked

```text
Profile: bundled exact SH-R80 profile
Run via Shizuku: OFF
Safe Mode: OFF
CPU pair: 3,4
Debug log: ON
Kernel log export: ON
```

The tested profile has `recommend_shizuku = 0`.

## Successful sequence

1. Install/open KernelSU once so GhostLock can discover its bundled `ksud`.
2. Import the exact profile.
3. Run GhostLock in direct/base mode.
4. GhostLock obtains UID 0 and bypasses the app seccomp filter.
5. GhostLock hands off to KernelSU using late-load for the Android13-5.15 KMI.
6. Open KernelSU and confirm the live driver is recognized.
7. Run `scripts/root-status.sh`.

A successful root check should include `uid=0(root)`.

## Reboot behavior

This route late-loads KernelSU into the currently running kernel. It does not patch or flash boot.

After a full reboot, expect root to be gone until GhostLock is run again.

## Known Shizuku behavior

A prior Shizuku/UserService run disconnected after the W1 stage. The direct/base run subsequently started with SELinux already permissive, indicating W1 had likely completed before the service disconnect.

Because direct mode completed the entire exploit and KernelSU handoff, it is the recommended route for this target.

## Do not casually change

After a confirmed working run, do not arbitrarily change:

- profile offsets;
- route geometry;
- CPU pair;
- physical-address assumptions;
- kernel manager during diagnosis.

Change one variable at a time and preserve logs.
