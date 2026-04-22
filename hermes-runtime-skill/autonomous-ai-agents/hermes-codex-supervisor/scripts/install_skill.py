from __future__ import annotations

import argparse
import shutil
from datetime import datetime
from pathlib import Path


SKILL_NAME = "hermes-codex-supervisor"
CATEGORY_NAME = "autonomous-ai-agents"


def detect_default_skills_root() -> Path:
    local_sidecar = Path(
        r"D:\a\workspace\4.在途项目\花姐工作助手\.runtime\phase22-hermes-sidecar\profiles\huajie_user_a\skills"
    )
    if local_sidecar.exists():
        return local_sidecar

    hermes_home = Path.home() / ".hermes"
    return hermes_home / "skills"


def copy_tree(src: Path, dst: Path) -> None:
    if dst.exists():
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup = dst.with_name(f"{dst.name}.bak_{timestamp}")
        shutil.move(str(dst), str(backup))
        print(f"Backed up existing target to {backup}")
    shutil.copytree(src, dst)


def main() -> None:
    parser = argparse.ArgumentParser(description="Install Hermes Codex Supervisor into a Hermes skills root.")
    parser.add_argument("--skills-root", type=Path, default=detect_default_skills_root())
    args = parser.parse_args()

    script_dir = Path(__file__).resolve().parent
    skill_dir = script_dir.parent
    category_dir = skill_dir.parent
    skills_root = args.skills_root.expanduser().resolve()
    target_category = skills_root / CATEGORY_NAME
    target_skill = target_category / SKILL_NAME

    target_category.mkdir(parents=True, exist_ok=True)

    source_description = category_dir / "DESCRIPTION.md"
    target_description = target_category / "DESCRIPTION.md"
    if source_description.exists() and not target_description.exists():
        shutil.copy2(source_description, target_description)
        print(f"Installed category description to {target_description}")

    copy_tree(skill_dir, target_skill)
    print(f"Installed skill to {target_skill}")


if __name__ == "__main__":
    main()
