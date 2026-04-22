# 恢复手册中文说明

## 文件作用

Codex 版：这份文件定义线程跑偏、停住、串线、验收失败时怎么恢复。

## 什么时候看

当多线程执行中出现意外，不能直接当完成时。

## 重点关注

- 典型异常
- 恢复路径
- 是否需要重新验收

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Recovery Playbook

Use this when a campaign does not move cleanly on the first pass.

## 1. Worker replied once and stopped

This is the most common false-finish pattern.

Hermes should:

- check whether the packet was iterative or one-shot
- if iterative, immediately issue the next round
- if one-shot, check whether the scoped validation really completed
- keep the campaign open until the stop rule is met

Do not accept "I posted one formatted summary" as completion.

## 2. Worker delivered partial output without validation

Hermes should:

- mark the thread `running` or `warn`, not `passed`
- route the exact missing check back to the owning worker
- keep acceptance thread moving in parallel where possible

## 3. Validation failed

Hermes should:

- record the failing command
- send the failure back to the owning worker with exact evidence
- avoid rewriting the whole campaign unless the truth changed

## 4. Two workers touched the same surface

Hermes should:

- freeze one writer
- reassign ownership
- merge only after the overlap is explicitly resolved

Parallelism is not worth silent drift.

## 5. External blocker appeared

Hermes should:

- log the blocker once
- keep all non-blocked work moving
- escalate only the minimal missing input, permission, or approval

## 6. Remote and local truth drifted

If current truth says remote is writable and local is mirror:

- treat remote as operational truth
- sync local or project records only after the remote state is clear
- do not let both sides keep changing independently

## 7. Acceptance surface is missing

Hermes should create or assign a bounded acceptance surface:

- minimal dry-run
- smoke script
- targeted regression entrypoint

Do not close a campaign without some real verification path.

## 8. User asked for repeated rounds

If the user explicitly asked for fixed rounds, Hermes should:

- preserve the round target
- keep dispatching until all rounds finish
- only stop early for red lines, external blockers, or explicit user interruption

This rule overrides the normal "first pass is enough" shortcut.
````
