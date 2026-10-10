# Kernel provenance

The SH-R80 build tested here runs:

```text
Linux version 5.15.178-android13-8-00025-g7feb0b0b7cd8-ab14134651
```

That suffix maps to Google's public Android common GKI:

- tag: `android13-5.15-2025-03_r11`
- commit: `7feb0b0b7cd82204ae4d1515e8a3cc3fc9f03529`
- Android CI build: `14134651`
- target: `kernel_aarch64`

The corresponding Google CI boot artifact used during analysis was:

```text
https://ci.android.com/builds/submitted/14134651/kernel_aarch64/latest/boot.img
```

The analyzed boot image was Android boot image v4 with a raw arm64 GKI kernel and no ramdisk.

## Important extractor finding

GhostLock's automatic embedded-symbol recovery initially mapped `remove_waiter` incorrectly and classified this kernel as fixed.

Using Google's matching `System.map` placed `remove_waiter` at:

```text
0x176d6e0 relative to _text
```

Inspection of the exact source/disassembly showed the vulnerable CVE-2026-43499 primitive. Re-running the extractor with the matching map reported the primitive present and selected the `multicast_waiter` route.

This is worth addressing upstream because a false "fixed" result can hide an actually viable target.
