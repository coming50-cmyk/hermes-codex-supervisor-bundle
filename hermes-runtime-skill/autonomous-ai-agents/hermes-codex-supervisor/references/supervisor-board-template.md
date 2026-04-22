# Supervisor Board Template

Keep one live board while Hermes supervises Codex.

```md
# Supervisor Board

- objective: <one line>
- mode: <direct / paired / four-thread / six-thread>
- write_locus: <local / remote / remote-primary+local-mirror>
- validation_surface: <script / tests / dry-run>
- reporting_surface: <STATUS / supervisor board / acceptance output>
- iterative_mode: <true/false>
- round_target: <n or n/a>
- last_truth_refresh_at: <timestamp>
- last_user_report_at: <timestamp or n/a>
- reporting_confidence: <high / medium / low>
- current_user_summary: <relay-safe one to three lines>
- current_verdict: <ready / running / blocked / verifying / passed / warn / failed>

## Threads

| Thread | Owned scope | Status | Relay-safe summary | Evidence basis | Last meaningful update | Validation | Blocker owner | Next action |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A | <...> | <...> | <...> | <files / commands / test> | <...> | <...> | <...> | <...> |
| B | <...> | <...> | <...> | <files / commands / test> | <...> | <...> | <...> | <...> |
| C | <...> | <...> | <...> | <files / commands / test> | <...> | <...> | <...> | <...> |
| D | <...> | <...> | <...> | <files / commands / test> | <...> | <...> | <...> | <...> |
```

Add `E` and `F` rows only when six-thread mode is active.

If `last_truth_refresh_at` is older than the newest thread update, refresh the board before reporting to the user.
