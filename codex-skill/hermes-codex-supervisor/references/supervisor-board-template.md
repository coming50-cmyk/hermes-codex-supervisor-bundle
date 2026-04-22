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
