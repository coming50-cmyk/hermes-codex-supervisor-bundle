# 任务分诊中文说明

## 文件作用

Hermes 运行时版：这份文件定义 supervisor 收到目标后的首轮判断流程。

## 什么时候看

当一个新目标刚进来，还没决定直接做还是拆线程时。

## 重点关注

- 任务大小判断
- 真相源读取
- direct 或 multi-thread 的入口判断

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Intake Triage

Run this before dispatching Codex workers.

## 1. Freeze the intake in one screen

Hermes should first write a short intake summary with:

- objective
- current accepted truth
- write locus
- validation surface
- red lines still in force
- execution mode
- iteration mode

Do not dispatch workers until these seven items are explicit.

Before writing that summary, resolve the real objective with this priority:

1. latest explicit user objective
2. latest accepted phase, active plan, or execution pack already frozen
3. latest concrete unfinished target in project truth
4. current repository only as a fallback

If the workspace is a skill repo, bundle repo, or packaging repo, do not assume that repo itself is the task target unless the user explicitly said so.

## 2. Choose the campaign type

Classify the work into one of these buckets:

- direct bounded fix
- phase execution or next-phase packaging
- phase revalidation
- common-foundation prework
- remote hygiene / repo hygiene / deployment support

If the project already has an accepted phase cadence, prefer extending that cadence instead of inventing a floating campaign.

If the user only said `接手` / `继续` / `你来管`, do not bounce the task back with a generic clarification request if a concrete accepted target already exists in the thread or project truth. State the inherited target and move on.

## 3. Freeze the write locus

Hermes must state which copy is writable:

- local only
- remote only
- GitHub-backed remote primary with local mirror

Never let workers assume this.

## 4. Freeze the iteration rule

Default rule:

- first deliverable only
- stop after the scoped pass unless the user or project truth explicitly asked for iteration

Iterative rule:

- only enable when the user explicitly asked for repeated rounds
- or the current phase / pack already requires fixed rounds
- when enabled, Hermes must state round target and stop condition

Example:

- `iterative_mode = true`
- `round_target = 10`
- `stop_rule = finish all 10 rounds unless a red line or external blocker appears`

## 5. Choose the thread count

Use this default:

- `direct` for small single-surface work
- `paired` for bounded implementation plus independent verification
- `four-thread` for substantial project work
- `six-thread` only when one of these is true:
  - user explicitly asked for six threads
  - accepted project truth already uses six threads
  - there are three independent implementation lanes plus dedicated acceptance and pack sync

Do not widen thread count just because parallelism sounds good.

## 6. Freeze the acceptance surface

Hermes must name the real validation surface before dispatch:

- acceptance script
- dry-run or smoke script
- targeted tests
- or a minimal acceptance note plus entrypoint if none exists

If no real validation surface exists yet, dispatch a dedicated thread to create it.

## 7. Output Hermes must leave behind

After triage, Hermes should be able to hand over:

- intake summary
- thread map with ownership
- worker packets
- supervisor status board
- acceptance target

If one of these is missing, intake is not done.
````
