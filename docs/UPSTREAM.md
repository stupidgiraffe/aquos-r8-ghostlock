# Upstream contribution plan

The preferred maintenance model is **upstream first**, not a permanent divergent GhostLock fork.

## Candidate upstream contributions

1. Add the exact SH-R80 kernel profile after sufficient repeated physical-device validation.
2. Document Sharp AQUOS R8 / FaYuiry as a known target.
3. Investigate the symbol-recovery error that misidentified `remove_waiter` on this GKI.
4. Consider broader root-manager discovery for KernelSU-family forks.

## Validation still desirable before profile PR

The profile has produced a real physical-device success, including KernelSU late-load. Before claiming broad stability, repeat from cold boot several times and preserve sanitized logs.

Suggested matrix:

| Test | Goal |
|---|---|
| Cold boot → direct run | Confirm full exploit from normal boot state |
| Second cold boot → direct run | Check repeatability |
| Third cold boot → direct run | Check repeatability |
| KernelSU late-load each run | Confirm manager handoff |
| Reboot after root | Confirm expected loss of live module |

Do not submit personally identifying log content. Strip unrelated logcat, package lists and user paths before publishing.
