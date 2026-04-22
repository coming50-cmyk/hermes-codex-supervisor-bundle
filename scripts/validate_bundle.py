from __future__ import annotations

import argparse
import sys
from pathlib import Path

import yaml


COMMON_REFS = [
    "campaign-rounds.md",
    "decision-matrix.md",
    "dual-delivery-model.md",
    "merge-checklist.md",
    "recovery-playbook.md",
    "release-publish-checklist.md",
    "status-report-contract.md",
    "thread-contract.md",
    "truth-sync-matrix.md",
    "user-reporting-protocol.md",
]


def parse_frontmatter(skill_path: Path) -> dict:
    text = skill_path.read_text(encoding="utf-8")
    parts = text.split("---", 2)
    if len(parts) != 3:
        raise ValueError(f"missing frontmatter: {skill_path}")
    data = yaml.safe_load(parts[1]) or {}
    if not isinstance(data, dict):
        raise ValueError(f"invalid frontmatter: {skill_path}")
    return data


def require_paths(paths: list[Path], errors: list[str]) -> None:
    for path in paths:
        if not path.exists():
            errors.append(f"missing: {path}")


def zh_path_for(path: Path) -> Path:
    return path.with_name(f"{path.stem}.zh-CN{path.suffix}")


def validate(root: Path) -> list[str]:
    errors: list[str] = []

    is_bundle = (root / "codex-skill").exists()
    if is_bundle:
        codex_skill = root / "codex-skill" / "hermes-codex-supervisor"
        hermes_category = root / "hermes-runtime-skill" / "autonomous-ai-agents"
        hermes_skill = hermes_category / "hermes-codex-supervisor"
    else:
        codex_skill = root / "codex" / "hermes-codex-supervisor"
        hermes_category = root / "autonomous-ai-agents"
        hermes_skill = hermes_category / "hermes-codex-supervisor"

    require_paths(
        [
            codex_skill / "SKILL.md",
            codex_skill / "agents" / "openai.yaml",
            codex_skill / "scripts" / "install-hermes-codex-supervisor.ps1",
            hermes_category / "DESCRIPTION.md",
            hermes_skill / "SKILL.md",
            hermes_skill / "scripts" / "install_skill.py",
        ],
        errors,
    )

    for ref in COMMON_REFS:
        require_paths(
            [
                codex_skill / "references" / ref,
                hermes_skill / "references" / ref,
            ],
            errors,
        )

    if errors:
        return errors

    for skill_path in [codex_skill / "SKILL.md", hermes_skill / "SKILL.md"]:
        try:
            data = parse_frontmatter(skill_path)
        except Exception as exc:  # pragma: no cover - defensive
            errors.append(str(exc))
            continue
        if data.get("name") != "hermes-codex-supervisor":
            errors.append(f"unexpected skill name in {skill_path}")
        if not data.get("description"):
            errors.append(f"missing description in {skill_path}")

    if is_bundle:
        readme = root / "README.md"
        if readme.exists():
            readme_text = readme.read_text(encoding="utf-8")
            if "## 中文" not in readme_text:
                errors.append("README.md missing inline Chinese section")

        for path in root.rglob("*.md"):
            if path.name.endswith(".zh-CN.md"):
                continue
            zh_path = zh_path_for(path)
            if not zh_path.exists():
                errors.append(f"missing zh companion: {zh_path}")

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate Codex/Hermes supervisor skill sources.")
    default_root = Path(__file__).resolve().parent.parent
    parser.add_argument("--root", type=Path, default=default_root)
    args = parser.parse_args()

    root = args.root.resolve()
    errors = validate(root)
    if errors:
        for item in errors:
            print(f"ERROR {item}")
        return 1

    print(f"OK sources validated: {root}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
