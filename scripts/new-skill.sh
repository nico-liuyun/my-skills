#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "用法：bash scripts/new-skill.sh <skill-name>"
  exit 1
fi

name="$1"

if [[ ! "$name" =~ ^[a-z0-9-]+$ ]]; then
  echo "skill 名称必须使用小写 kebab-case。"
  exit 1
fi

target="skills/$name"

if [[ -e "$target" ]]; then
  echo "skill 已存在：$target"
  exit 1
fi

mkdir -p "$target/agents" "$target/references" "$target/scripts" "$target/assets"
cp "templates/skill/SKILL.md" "$target/SKILL.md"
cp "templates/skill/agents/openai.yaml" "$target/agents/openai.yaml"

sed -i.bak "s/sample-skill/$name/g" "$target/SKILL.md"
rm "$target/SKILL.md.bak"

display_name="$name"
sed -i.bak "s/示例 Skill/$display_name/g" "$target/agents/openai.yaml"
rm "$target/agents/openai.yaml.bak"

echo "已创建：$target"
