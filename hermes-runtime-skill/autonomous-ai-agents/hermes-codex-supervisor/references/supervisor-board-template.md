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
