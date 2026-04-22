# Thread Contract

Use this mapping only when a four-thread split is actually justified:

## Thread A

- freeze truth
- freeze guardrails
- define ownership
- define release conditions

## Thread B

- main workstream 1
- highest-value implementation track

## Thread C

- main workstream 2
- independent parallel implementation or validation track

## Thread D

- acceptance
- runbook
- evidence
- final close-out support

## Optional six-thread split

Use this only when the project truth or user explicitly requires wider parallelism.

## Thread A

- truth freeze
- guardrails
- ownership

## Thread B

- main workstream 1

## Thread C

- main workstream 2

## Thread D

- main workstream 3 or integration lane

## Thread E

- acceptance
- regression
- runbook alignment

## Thread F

- pack sync
- evidence collection
- merge-prep support

## Required thread fields

Every thread packet must define:

- thread name
- current truth
- allowed files / scope
- forbidden scope
- required outputs
- validation requirements
- blocker behavior
- fixed final reply format
- whether the thread is iterative or one-shot
- if iterative: round target and stop rule

## Iteration rule

Do not make every thread iterative by default.

Only add "keep iterating after first delivery" when:

- the user explicitly asked for repeated rounds
- or accepted project truth already requires ongoing iteration

If only some threads should iterate, say that explicitly.
