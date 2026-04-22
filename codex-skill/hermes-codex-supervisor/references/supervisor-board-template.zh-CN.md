# 总控状态板中文说明

## 文件作用

Codex 版：这份文件提供总控线程维护全局状态板的模板。

## 什么时候看

当你要同时盯多个线程，又不想靠聊天记录猜当前进度时。

## 重点关注

- 线程状态
- 阻塞项
- 下一步和收口条件

## 对照说明

这份中文文件用于发布时直接提供中文可读内容。下方保留英文原文，避免中文页缺细节。

## 英文原文

````markdown
# Supervisor Board Template

Use this as the default live status surface for Hermes.

## 1. Compact board

```md
# Supervisor Board

- objective: <one line>
- mode: <direct / paired / four-thread / six-thread>
- write_locus: <local / remote / remote-primary+local-mirror>
- validation_surface: <script / tests / dry-run>
- iterative_mode: <true/false>
- round_target: <n or n/a>
- current_verdict: <ready / running / blocked / verifying / passed / warn / failed>

## Threads

| Thread | Owned scope | Status | Last meaningful update | Validation | Blocker owner | Next action |
| --- | --- | --- | --- | --- | --- | --- |
| A | <...> | <...> | <...> | <...> | <...> | <...> |
| B | <...> | <...> | <...> | <...> | <...> | <...> |
| C | <...> | <...> | <...> | <...> | <...> | <...> |
| D | <...> | <...> | <...> | <...> | <...> | <...> |
```

## 2. Six-thread board

Add rows `E` and `F` when six-thread mode is active.

## 3. Update rule

Hermes should update the board when:

- a thread starts
- a thread changes status
- a blocker appears or clears
- validation starts or finishes
- a new round begins in iterative mode

Do not let the board trail far behind real progress.

## 4. Current verdict rule

The board-level `current_verdict` is:

- `running` while meaningful work is still in progress
- `blocked` only if the campaign is materially blocked
- `verifying` while the final validation surface is rerunning
- `passed`, `warn`, or `failed` only after Hermes has applied the merge checklist
````
