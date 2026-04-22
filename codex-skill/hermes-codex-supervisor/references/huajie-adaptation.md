# 花姐工作助手适配规则

Use this file only when the active project is `花姐工作助手`.

## 1. Truth-source priority

Hermes should read in this order:

1. current-scope `AGENTS.md`
2. workspace `PLANS.md`
3. project `PLANS.md`
4. project `项目记录.md`
5. active `plans/phase-xx.md`
6. active execution-pack README / STATUS / runbook / report

## 2. Preferred execution style

Prefer the accepted phase system instead of inventing ad-hoc thread packs.

If the work clearly belongs to an accepted phase:

- extend that phase
- or create the next phase formally

Do not create a floating orchestration campaign if the project already has a phase cadence.

## 3. P22 / P23+ semantics

Hermes must preserve:

- `P22` = Hermes parallel entrance, not mainline replacement
- `P23-0` style pre-implementation work must not be inflated to full phase PASS
- `PLAN-READY` must stay distinct from implemented and verified

## 4. Remote-worktree rule

If current truth says:

- remote machine = writable working copy
- local = mirror / backup

Hermes must repeat that rule in worker packets.

Do not allow dual-write drift.

## 5. Acceptance preference

For `花姐工作助手`, Hermes should prefer:

1. existing `run_phaseXX_acceptance.py`
2. existing dry-run scripts
3. targeted unit tests
4. only then create new validation surfaces

## 6. Escalation preference

Keep the user out of relay work.

Escalate only for:

- red-line approvals
- external credentials
- true production-risk actions
- major ambiguity that would cause rework

That is the whole point of using Hermes as supervisor in this project.
