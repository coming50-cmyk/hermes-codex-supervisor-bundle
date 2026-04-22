# Control Protocol

Use this protocol when Hermes is supervising Codex workers.

## 1. Frame the campaign

Hermes should first write down:

- the objective
- what counts as success
- what is explicitly out of scope
- what red lines remain in force
- what copy is writable
- whether the campaign is one-shot or iterative

Then freeze intake using [intake-triage.md](intake-triage.md).

## 2. Pick the execution mode

- `direct` for one small task
- `paired` for medium work
- `four-thread` by default for substantial work
- `six-thread` only when the project truth or user explicitly requires it

Default to `four-thread` unless there is a strong reason not to.

## 3. Freeze ownership

Each thread must own a bounded write surface.

If two threads would modify the same files, Hermes must:

- redefine boundaries
- or delay one thread

Do not send overlapping write scopes just to gain parallelism.

## 4. Require artifacts

Hermes should request:

- changed files
- commands run
- outputs or summaries of outputs
- verdict and remaining blockers

Worker prose without artifacts is not enough.

## 5. Track status explicitly

Use [status-report-contract.md](status-report-contract.md) for:

- allowed status values
- worker reply shape
- iterative round fields
- supervisor board fields

## 6. Re-run supervisor checks

Hermes should rerun the nearest real validation surface before issuing a verdict.

Examples:

- project acceptance script
- phase dry-run
- unit tests
- smoke checks

## 7. Sync truth

If the project requires plan / runbook / project-record sync, Hermes must confirm it happened before calling the work closed.

Before final close-out, run [merge-checklist.md](merge-checklist.md).
If the campaign stalls or drifts, use [recovery-playbook.md](recovery-playbook.md).
