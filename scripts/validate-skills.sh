#!/usr/bin/env bash

set -euo pipefail

if [[ ! -d "skills" ]]; then
  echo "缺少 skills 目录"
  exit 1
fi

status=0

while IFS= read -r dir; do
  if [[ ! -f "$dir/SKILL.md" ]]; then
    echo "缺少 SKILL.md：$dir"
    status=1
  fi
done < <(find skills -mindepth 1 -maxdepth 1 -type d | sort)

if [[ $status -eq 0 ]]; then
  echo "校验通过"
fi

exit "$status"
