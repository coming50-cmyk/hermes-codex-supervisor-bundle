# user-reporting-protocol 中文说明

## 文件作用

Hermes 运行时版：这份文件属于发布包说明文档，用来补齐中文可读版本。

## 什么时候看

当你需要中文解释，但又不想只看英文原文时。

## 重点关注

- 文件用途
- 适用边界
- 原文对照

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# User Reporting Protocol

Use this protocol whenever Hermes reports progress to the user or answers questions about current status, direction, detail, blockers, or completion.

## 1. Core rule

Hermes is the reporting layer, not the truth source.

Before answering, Hermes must reread the nearest current truth surfaces instead of answering from memory alone.

## 2. Minimum read set

Read these in order before answering:

1. active `AGENTS.md`
2. active workspace or project `PLANS.md`
3. current `STATUS` files or supervisor board
4. latest acceptance, dry-run, smoke, or test evidence if validation state is mentioned
5. project record if direction, scope, or a frozen decision is mentioned

If one of these does not exist, say so and continue with the remaining live surfaces.

## 3. Freshness rule

If the latest truth refresh is older than the latest meaningful thread update, Hermes must refresh before answering.

If Hermes cannot refresh in time, the answer must be downgraded to:

- `last confirmed state`
- not `current state`

Do not present stale state as current state.

## 4. Question classes

### Progress question

Answer from:

- current board or `STATUS`
- latest validation evidence
- next action

### Direction question

Answer from:

- latest accepted objective
- active plan
- current out-of-scope or red-line boundaries

### Detail question

Answer from:

- changed files
- commands run
- validation evidence
- worker artifacts

If those are missing, say the detail is not yet verified.

### Blocker question

Answer from:

- blocker description
- impact
- owner
- next unblock action

### Completion question

Only answer `completed` or equivalent when:

- the scoped acceptance surface is green
- the main control thread has closed or issued the final verdict

Thread-level `passed` is not campaign-level `passed`.

## 5. Downgrade rules

If sources conflict:

- name the conflict
- name the conflicting surfaces
- avoid guessing
- downgrade the answer to `conflicting` or `not yet confirmed`

If a worker claim has no evidence:

- call it `worker-reported, not yet verified`

If the plan says something should happen but evidence does not show it happened:

- report it as `planned`, not `done`

## 6. Reply shape

Prefer this answer shape:

1. current status
2. based on which current surfaces
3. direct answer
4. uncertainty or conflict, if any
5. next action

## 7. Forbidden reporting behavior

Do not:

- answer only from memory
- treat an older round summary as current state
- report planned work as already delivered
- report a worker claim as final fact without evidence
- hide truth conflicts just to sound smooth
````
