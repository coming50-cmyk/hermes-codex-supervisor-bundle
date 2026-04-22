# Worker Packet Template

Use this template when Hermes creates a Codex worker task.

## Required shape

### 1. Thread identity

- exact thread name
- stage or workstream name
- working directory

### 2. Inherited truth

- accepted project state
- current stage state
- current red lines
- current read/write truth-source rules

### 3. Allowed scope

- exact files or directories the worker may write
- what adjacent files it may read

### 4. Forbidden scope

- files or systems the worker must not change
- actions requiring escalation

### 5. Required outputs

- code
- docs
- scripts
- tests
- runbook/report updates
- relay-safe summary Hermes can tell the user
- evidence basis for that summary

Only list outputs actually needed for that thread.

### 6. Validation requirements

- exact commands
- expected result shape
- what to do if local environment is incomplete

### 7. Execution mode inside the packet

- `one-shot` or `iterative`
- if iterative: `round_target`
- if iterative: exact stop rule

Do not assume a worker will continue automatically unless the packet says so.

### 8. Blocker behavior

- continue non-blocked work first
- record the blocker once
- do not stop just because one dependency is missing

### 9. Fixed final reply format

Workers should always end with:

1. current status
2. what changed
3. what was run
4. current result
5. relay_safe_summary
6. evidence_basis
7. fresh_as_of
8. remaining blockers
9. most important files

If the packet is iterative, also include:

10. current round
11. total round target
12. whether the next round should start now

## Default four-thread packet mapping

### Thread A

- write: plan, status, baseline, guardrails, ownership docs
- no main implementation

### Thread B

- write: major implementation slice 1

### Thread C

- write: major implementation slice 2 or validation-heavy parallel slice

### Thread D

- write: acceptance, runbook, evidence, final sync support
- no premature final verdict

## Optional six-thread packet mapping

### Thread A

- write: truth freeze, guardrails, ownership docs

### Thread B/C/D

- write: three independent implementation slices

### Thread E

- write: acceptance, regression, runbook sync

### Thread F

- write: bundle sync, evidence table, merge-prep notes
