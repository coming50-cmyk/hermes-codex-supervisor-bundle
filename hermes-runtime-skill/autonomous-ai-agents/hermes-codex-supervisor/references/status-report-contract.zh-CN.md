# 状态回报中文说明

## 文件作用

Hermes 运行时版：这份文件定义 worker 和 supervisor 之间的状态回报格式。

## 什么时候看

当多线程推进中需要统一进度、阻塞、验收口径时。

## 重点关注

- 状态字段
- 回报节奏
- 主线程如何据此裁决

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Status Report Contract

Use this contract for both worker replies and Hermes' own supervisor board.

## 1. Allowed status set

Only use:

- `ready`
- `running`
- `blocked`
- `verifying`
- `passed`
- `warn`
- `failed`

Do not invent synonyms such as "done", "almost", or "waiting a bit".

## 2. Worker reply shape

Every worker update should include:

1. current status
2. what changed
3. what was run
4. current result
5. remaining blockers
6. most important files

For multi-round work, add:

7. `round_now`
8. `round_target`
9. `continue_next_round = yes/no`

## 3. Supervisor board fields

Hermes should track each thread with:

- thread name
- owned scope
- current status
- last meaningful update
- validation state
- blocker owner
- next action

This can live in a status file, phase status table, or a short supervisor note.

## 4. Interpretation rules

- `passed` means the thread-level scoped deliverable and its key checks are green
- `warn` means useful output landed but there is still a real remaining blocker
- `failed` means the claimed surface is contradicted or broken

Thread `passed` does not mean campaign `passed`.

## 5. First-reply trap rule

If `iterative_mode = true`, Hermes must not stop after the worker's first formatted reply.

Hermes should:

- record the round result
- issue the next round
- keep the thread `running` unless the stop rule is met

Only stop an iterative thread early for:

- red lines
- external blockers
- explicit user stop
- all accepted stop conditions already met

## 6. Verification handoff

When a worker reports `verifying`, the reply must name the command or script being run.

When a worker reports `passed`, the reply must name the exact validation surface that went green.

If either is missing, Hermes should downgrade the claim until evidence is supplied.
````
