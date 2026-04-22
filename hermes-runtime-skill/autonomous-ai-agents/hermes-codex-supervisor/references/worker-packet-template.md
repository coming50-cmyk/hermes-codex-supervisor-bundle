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

Validation requirements:
- <exact commands>
- <expected result shape>

Blocker behavior:
- continue non-blocked work first
- record the blocker once
- do not stop just because one dependency is missing

Reply format:
1. what changed
2. what was run
3. current result
4. remaining blockers
5. most important files
```

If the campaign is iterative, append:

- current round
- total round target
- whether the next round should start now
