# Worker Packet Template

Use this template when Hermes writes a Codex worker packet.

```md
Thread:
- <thread name>
- <lane purpose>
- <working directory>

Inherited truth:
- <current project state>
- <current phase or task state>
- <current red lines>
- <write locus>

Allowed scope:
- <files or directories this worker may write>

Forbidden scope:
- <files or systems this worker must not change>
- <actions requiring escalation>

Required outputs:
- <code, docs, tests, runbook, report, status updates>
- <relay-safe summary Hermes can tell the user>
- <evidence basis for that summary>

Validation requirements:
- <exact commands>
- <expected result shape>

Blocker behavior:
- continue non-blocked work first
- record the blocker once
- do not stop just because one dependency is missing

Reply format:
1. current status
2. what changed
3. what was run
4. current result
5. relay_safe_summary
6. evidence_basis
7. fresh_as_of
8. remaining blockers
9. most important files
```

If the campaign is iterative, append:

- current round
- total round target
- whether the next round should start now
