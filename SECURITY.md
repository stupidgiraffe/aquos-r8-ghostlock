# Security / safety notes

This repository contains an exact-build kernel exploit profile intended for owner-controlled device research.

- Treat every OTA/kernel change as unsupported until revalidated.
- A wrong kernel-memory profile can crash or corrupt the running kernel.
- Do not flash images from this repository; none are provided.
- Do not disable target checks just to make a mismatched build run.
- Keep a copy of successful GhostLock debug logs before experimenting with alternate managers.
- Report profile/extractor problems through GitHub issues with sanitized logs only.
