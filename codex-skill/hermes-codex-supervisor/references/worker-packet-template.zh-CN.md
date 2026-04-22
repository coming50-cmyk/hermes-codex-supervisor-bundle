# Worker 包中文说明

## 文件作用

Codex 版：这份文件提供派发给 worker 的标准任务包模板。

## 什么时候看

当主线程需要一次性把边界、目标、验证、阻塞口径交给执行线程时。

## 重点关注

- 任务目标
- 允许改动范围
- 固定回复格式与验证要求

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Worker Packet Template

Use this template when Hermes creates a Codex worker task.

## Required shape

### 1. Thread identity

- exact thread name
- stage or workstream name
- working directory

### 2. Inherited truth

- accepted project state
- current stage state
- current red lines
- current read/write truth-source rules

### 3. Allowed scope

- exact files or directories the worker may write
- what adjacent files it may read

### 4. Forbidden scope

- files or systems the worker must not change
- actions requiring escalation

### 5. Required outputs

- code
- docs
- scripts
- tests
- runbook/report updates

Only list outputs actually needed for that thread.

### 6. Validation requirements

- exact commands
- expected result shape
- what to do if local environment is incomplete

### 7. Execution mode inside the packet

- `one-shot` or `iterative`
- if iterative: `round_target`
- if iterative: exact stop rule

Do not assume a worker will continue automatically unless the packet says so.

### 8. Blocker behavior

- continue non-blocked work first
- record the blocker once
- do not stop just because one dependency is missing

### 9. Fixed final reply format

Workers should always end with:

1. what changed
2. what was run
3. current result
4. remaining blockers
5. most important files

If the packet is iterative, also include:

6. current round
7. total round target
8. whether the next round should start now

## Default four-thread packet mapping

### Thread A

- write: plan, status, baseline, guardrails, ownership docs
- no main implementation

### Thread B

- write: major implementation slice 1

### Thread C

- write: major implementation slice 2 or validation-heavy parallel slice

### Thread D

- write: acceptance, runbook, evidence, final sync support
- no premature final verdict

## Optional six-thread packet mapping

### Thread A

- write: truth freeze, guardrails, ownership docs

### Thread B/C/D

- write: three independent implementation slices

### Thread E

- write: acceptance, regression, runbook sync

### Thread F

- write: bundle sync, evidence table, merge-prep notes
````
