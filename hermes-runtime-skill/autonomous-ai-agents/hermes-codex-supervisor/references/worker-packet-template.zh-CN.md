# Worker 包中文说明

## 文件作用

Hermes 运行时版：这份文件提供派发给 worker 的标准任务包模板。

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

Use this template when Hermes writes a Codex worker packet.

```md
Thread:
- <thread name>
- <lane purpose>
- <working directory>

Inherited truth:
- <current project state>
- <current phase or task state>
- <current red lines>
- <write locus>

Allowed scope:
- <files or directories this worker may write>

Forbidden scope:
- <files or systems this worker must not change>
- <actions requiring escalation>

Required outputs:
- <code, docs, tests, runbook, report, status updates>
- <relay-safe summary Hermes can tell the user>
- <evidence basis for that summary>

Validation requirements:
- <exact commands>
- <expected result shape>

Blocker behavior:
- continue non-blocked work first
- record the blocker once
- do not stop just because one dependency is missing

Reply format:
1. current status
2. what changed
3. what was run
4. current result
5. relay_safe_summary
6. evidence_basis
7. fresh_as_of
8. remaining blockers
9. most important files
```

If the campaign is iterative, append:

- current round
- total round target
- whether the next round should start now
````
