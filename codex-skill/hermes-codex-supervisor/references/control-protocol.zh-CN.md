# 控制协议中文说明

## 文件作用

Codex 版：这份文件定义 Codex 侧 supervisor 的控制协议，包括总控应怎么发起、跟踪、收口。

## 什么时候看

当 Codex 作为总控直接接手多线程施工时。

## 重点关注

- 总控职责
- worker 派发方式
- 验收与真相源回写

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
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
- `four-thread` when the task naturally splits into truth freeze + two main lanes + acceptance
- `six-thread` only when the project truth or user explicitly requires it

There is no standing default thread count.
Pick the smallest shape that matches the real coupling and validation surface.

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
````
