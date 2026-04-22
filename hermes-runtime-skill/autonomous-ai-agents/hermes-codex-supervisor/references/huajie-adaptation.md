# 花姐工作助手 Adaptation

Use this only when the active project is `花姐工作助手`.

## Truth priority

Read in this order:

1. active `AGENTS.md`
2. workspace `PLANS.md`
3. project `PLANS.md`
4. project `项目记录.md`
5. active `plans/phase-xx.md`
6. current execution-pack README, STATUS, runbook, and acceptance report

## Project-specific rules

- Preserve `P22 = Hermes parallel entrance, not mainline replacement`
- Keep `PLAN-READY` distinct from implemented and verified
- If current truth says remote is writable and local is mirror, repeat that rule in every Codex worker packet
- Prefer the accepted phase cadence over ad-hoc campaigns
- Prefer `run_phaseXX_acceptance.py` or existing dry-run scripts as the validation surface
- Do not make every thread iterative; only the threads explicitly marked iterative should continue after round one

## Default split for substantial phase work

- Thread A: truth freeze and pack boundaries
- Thread B: main implementation lane 1
- Thread C: main implementation lane 2
- Thread D: acceptance, runbook, evidence, merge-prep

Use six threads only if the user explicitly asked for six or the accepted pack already uses six.
