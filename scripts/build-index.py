#!/usr/bin/env python3

import json
from pathlib import Path


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    skills_dir = root / "skills"
    skills = []

    if skills_dir.exists():
        for entry in sorted(skills_dir.iterdir()):
            if entry.is_dir():
                skills.append(
                    {
                        "name": entry.name,
                        "path": str(entry.relative_to(root)),
                        "has_skill_md": (entry / "SKILL.md").exists(),
                    }
                )

    index_dir = root / "index"
    index_dir.mkdir(exist_ok=True)
    (index_dir / "skills.json").write_text(json.dumps(skills, indent=2) + "\n")


if __name__ == "__main__":
    main()
