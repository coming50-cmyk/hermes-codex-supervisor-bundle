# 总控状态板中文说明

## 文件作用

Hermes 运行时版：这份文件提供总控线程维护全局状态板的模板。

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

Keep one live board while Hermes supervises Codex.

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

Add `E` and `F` rows only when six-thread mode is active.
````
