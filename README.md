# Hermes Codex Supervisor Bundle

Hermes Codex Supervisor Bundle packages the same supervisor workflow for two runtimes:

- `codex-skill/` for Codex desktop or local Codex CLI environments
- `hermes-runtime-skill/` for Hermes profile-based runtime environments

The two variants should stay behaviorally aligned, but they intentionally use different runtime packaging and installer entrypoints.

## Repository Layout

```text
.
├─ codex-skill/
│  └─ hermes-codex-supervisor/
├─ hermes-runtime-skill/
│  └─ autonomous-ai-agents/
│     └─ hermes-codex-supervisor/
└─ scripts/
   └─ validate_bundle.py
```

## What This Bundle Is For

Use this bundle when you want Hermes or Codex to take over control-plane work such as:

- freezing project truth before execution
- splitting work into threads or worktrees
- supervising multi-thread execution
- rerunning acceptance before close-out
- merging results and syncing truth sources

This bundle is not a business project template and does not ship application code, secrets, runtime data, or environment-specific credentials.

## Quick Start

### Install the Codex variant

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\codex-skill\hermes-codex-supervisor\scripts\install-hermes-codex-supervisor.ps1
```

### Install the Hermes runtime variant

```powershell
python .\hermes-runtime-skill\autonomous-ai-agents\hermes-codex-supervisor\scripts\install_skill.py --skills-root <target-skills-root>
```

If `--skills-root` is omitted, the installer falls back to:

1. `HERMES_SKILLS_ROOT`
2. `HERMES_HOME/skills`
3. `~/.hermes/skills`

## Validation

Validate the published bundle before distribution:

```powershell
python .\scripts\validate_bundle.py --root .
```

The validation script checks:

- required `SKILL.md` files
- required references
- installer entrypoints
- frontmatter structure

## Maintenance Rules

- Keep the Codex and Hermes variants semantically aligned.
- Treat installed copies as runtime targets, not as the long-term source of truth.
- Publish only from the repository source, not from live runtime directories.
- Consider a GitHub release complete only after remote push succeeds.

## Language

- English README: `README.md`
- Chinese README: `README.zh-CN.md`
