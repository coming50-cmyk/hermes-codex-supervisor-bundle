# 技能中文说明

## 文件作用

Hermes 运行时版：这份文件定义技能的主入口、适用边界、执行方式和升级规则。

## 什么时候看

当你需要判断这个技能到底负责什么、不该负责什么，以及调用后会怎样执行时。

## 重点关注

- 触发条件与非适用场景
- 读取真相源的顺序
- 线程拆分、验收、合并、升级边界

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
---
name: hermes-codex-supervisor
description: "Use when Hermes should act as the control tower over Codex CLI sessions: freeze project truth, split work into Codex threads or worktrees, monitor progress, rerun acceptance, merge results, and replace the human relay. Trigger on requests like 接管 Codex, 拆线程, 多线程推进, 盯进度, 验收收口, 主线程合并, 别让我传话."
version: 1.0.0
author: Local Workspace
license: MIT
metadata:
  hermes:
    tags: [Hermes, Codex, Multi-Agent, Supervisor, Acceptance, Worktree]
    related_skills: [codex, hermes-agent]
---

# Hermes Codex Supervisor

Use this skill when Hermes should supervise Codex instead of making the user relay between threads.

## What this skill is for

- Turn one goal into a bounded Codex execution campaign
- Decide the execution shape and thread count from the actual task instead of hardcoding one split
- Launch Codex workers in separate worktrees or directories
- Keep a supervisor status board
- Report current progress back to the user
- Answer progress, direction, and detail questions from current truth instead of stale memory
- Rerun real validation before closing
- Merge results and truth-sync updates

Do not use this skill for pure brainstorming or tiny one-file tasks.

## Prerequisites

- Codex CLI installed and working
- A git repository for code tasks
- Hermes `terminal`, `process`, `file`, and `todo` tools enabled
- Use `pty=true` for Codex terminal sessions

If Codex is not ready, first use the `codex` skill to verify:

```python
terminal(command="codex --version", workdir="~/project", pty=True)
```

## Read order before dispatch

Before launching any Codex worker, read the minimum truth sources:

1. active `AGENTS.md`
2. active workspace or project `PLANS.md`
3. project record such as `项目记录.md`
4. current phase file, execution pack, runbook, or acceptance entrypoint if the project uses phases

Then read:

- `references/control-loop.md`
- `references/intake-triage.md`
- `references/starter-prompt-template.md`
- `references/thread-contract.md`
- `references/status-report-contract.md`
- `references/worker-packet-template.md`
- `references/supervisor-board-template.md`
- `references/campaign-rounds.md`
- `references/user-reporting-protocol.md`
- `references/escalation-boundaries.md`
- `references/decision-matrix.md`
- `references/merge-checklist.md`
- `references/recovery-playbook.md`
- `references/truth-sync-matrix.md`
- `references/dual-delivery-model.md`
- `references/release-publish-checklist.md`
- `references/github-inspirations.md` when you need to compare orchestration patterns instead of improvising one

## Objective resolution rule

Before you say what you are taking over, resolve the target in this priority order:

1. the user's latest explicit concrete goal
2. the latest accepted phase, execution pack, or active plan already frozen in the thread or project
3. the latest concrete unfinished target recorded in project truth
4. only if none of the above exist, the current repository itself

Do not default to "the current repository" just because:

- the workspace is a skill repo
- the current folder is a GitHub bundle or packaging repo
- the conversation recently discussed release plumbing

If the user says `接手`, `继续`, `你来管`, or similar handoff language after a long thread, inherit the most recent accepted concrete objective first.

Only ask the user to restate the goal when all of these are true:

- there is no recent explicit objective
- there is no accepted active plan you can inherit
- there is no project record pointing to one concrete unfinished target

When you can infer the target from current truth, state the inherited target and continue. Do not bounce the task back with a generic clarification request.

Bad handoff interpretation:

- "当前看的对象是这个 hermes-codex-supervisor-bundle 仓库，所以先问你要拿这个仓库干嘛"

Correct handoff interpretation:

- "我接手的是上一轮已经冻结的具体目标；当前仓库只是工具或交付载体，不自动等于主任务对象"

## Execution mode

Choose one mode first. Do not improvise thread count later, and do not hardcode four-thread or six-thread as the only valid shape.

### `direct`

Use only when all are true:

- one bounded directory or one file cluster
- one validation surface
- likely under 30 minutes
- no separate acceptance or merge lane needed

### `paired`

Use when:

- one Codex worker can implement
- one Hermes-managed lane can prepare acceptance or review

### `four-thread`

Use when the task naturally splits into:

- Thread A: truth freeze, boundaries, guardrails
- Thread B: main implementation lane 1
- Thread C: main implementation lane 2
- Thread D: acceptance, runbook, evidence, merge-prep

### `six-thread`

Only use when one of these is true:

- the user explicitly asked for six threads
- accepted project truth already uses six threads
- there are three independent implementation lanes plus dedicated acceptance and pack-sync work

There is no universal default thread count.
Pick the smallest shape that matches the real coupling and validation needs.

## Core rules

1. Hermes is the supervisor, not the human relay.
2. Workers do not issue the final verdict.
3. Do not trust a worker summary without artifacts.
4. Do not mark work complete because the first formatted reply arrived.
5. Only enable multi-round iteration when the user explicitly asked for repeated rounds or accepted project truth already requires it.

Use `references/intake-triage.md` to freeze campaign type, write locus, thread count, and iteration rule before dispatch.
Use `references/decision-matrix.md` for verdict choice.

## Launch pattern

### 1. Freeze the campaign

Hermes should first write a short intake summary:

- objective
- success condition
- out of scope
- write locus
- validation surface
- red lines
- execution mode
- iteration rule

If the user wants copy-ready launch language instead of a freehand opener, use `references/starter-prompt-template.md`.

### 2. Prepare isolated work areas

Use git worktrees for parallel Codex lanes:

```python
terminal(command="git worktree add -b codex/thread-b /tmp/project-thread-b HEAD", workdir="~/project")
terminal(command="git worktree add -b codex/thread-c /tmp/project-thread-c HEAD", workdir="~/project")
```

If the repo already has phase-specific worktrees, reuse them instead of inventing new paths.

### 3. Write worker packets

Create a bounded prompt file for each lane using the template in `references/worker-packet-template.md`.

Minimum fields:

- thread identity
- inherited truth
- allowed scope
- forbidden scope
- required outputs
- validation requirements
- blocker behavior
- fixed reply shape

Also keep ownership aligned with `references/thread-contract.md`.

### 4. Start Codex workers

Prefer background Codex sessions for anything non-trivial:

```python
terminal(
    command="codex exec --full-auto \"$(cat thread-b-prompt.md)\"",
    workdir="/tmp/project-thread-b",
    background=True,
    pty=True,
)
```

Use `--yolo` only when the project's red-line policy already allows approval bypass and the write surface is trusted.

### 5. Monitor workers

Monitor with `process` instead of interrupting blindly:

```python
process(action="poll", session_id="<id>")
process(action="log", session_id="<id>")
```

If Codex asks a question that can be answered from current project truth, answer it directly through `process(action="submit", ...)`. Do not forward simple relay questions to the user.

### 6. Report to the user from live truth

Hermes is also the user-facing reporting layer during execution.

When the user asks about:

- current progress
- current direction
- why the task was split this way
- what one thread changed
- what is still blocked

Hermes must first reread the nearest live truth surfaces before answering:

1. active `AGENTS.md`
2. active workspace or project `PLANS.md`
3. current `STATUS` files or supervisor board
4. latest acceptance, dry-run, smoke, or test evidence
5. project record when it contains the latest frozen decision

Do not answer these questions from Hermes' own memory cache alone.
Do not treat yesterday's summary as today's state.
Do not upgrade a worker's prose summary into final fact without checking artifacts.
Use `references/user-reporting-protocol.md` whenever the question is about current progress, direction, detail, blockers, or completion.

## Supervisor board

Keep one live board using the template in `references/supervisor-board-template.md`.

Update it whenever:

- a worker starts
- a worker changes status
- a blocker appears or clears
- validation starts or finishes
- a new round begins in iterative mode

Allowed statuses:

- `ready`
- `running`
- `blocked`
- `verifying`
- `passed`
- `warn`
- `failed`

Use `references/status-report-contract.md` to keep worker replies and the supervisor board on one status vocabulary.

## Acceptance and merge

Hermes must rerun the nearest real validation surface before final close-out:

1. existing phase acceptance script
2. existing dry-run or smoke script
3. targeted tests
4. only if none exist: create a minimal acceptance note and validation entrypoint

Do not close on:

- "Codex said done"
- "files changed"
- "code compiles"

Merge order:

1. truth freeze lane closes first
2. implementation lanes close next
3. acceptance lane aligns runbook and evidence
4. Hermes reruns validation and issues the final verdict

Before closure, rerun `references/merge-checklist.md`.
If worker overlap, partial output, or validation failure appears, use `references/recovery-playbook.md` instead of improvising a reset.
Use `references/truth-sync-matrix.md` to decide which plan, status, runbook, report, and project record surfaces must be updated before the final verdict.

## Escalation rules

Escalate to the user only when:

- credentials, keys, or permissions are missing
- paid actions are required
- production or public interface changes are required
- external send, delete, or irreversible actions are required
- a major ambiguity would cause real rework

If the user already said "keep going", continue non-blocked work first.

Use `references/escalation-boundaries.md` when there is any doubt about whether Hermes should stop or keep moving.

## Iteration rule

Default is one-shot execution.

Only keep re-dispatching rounds when:

- the user explicitly asked for multiple rounds
- or accepted project truth freezes a multi-round process

If iterative mode is active, Hermes must freeze:

- round target
- stop rule
- which threads continue past round one

Use `references/campaign-rounds.md` whenever the campaign has fixed repeated rounds.

## GitHub / Remote / Mirror Rule

If the project uses:

- GitHub as version truth
- a remote machine as the writable working copy
- and local as mirror / backup

Hermes must state that relationship explicitly and keep all worker packets aligned to it.

Never allow:

- dual-write drift
- remote and local both claiming to be primary
- "published" claims when only local commit happened

## Dual Delivery Model

If the same supervisor method must exist in both Codex and Hermes runtimes:

- keep workflow semantics aligned
- keep package formats separate
- treat installed runtime copies as targets, not long-term source-of-truth

Use `references/dual-delivery-model.md` before syncing or publishing both variants.

## Release / Publish Campaigns

If the user asks to publish this skill stack:

- validate both Codex and Hermes variants
- package both into one publishable bundle
- verify installer scripts before git operations
- only claim GitHub publication after remote push succeeds

If remote URL or auth is missing, stop at a publish-ready local repo and report the exact missing external condition.
Use `references/release-publish-checklist.md`.

## Final response shape

Hermes should close with:

1. overall verdict
2. what actually ran
3. what passed
4. what remains blocked
5. which truth sources were updated
6. exact next step
````
