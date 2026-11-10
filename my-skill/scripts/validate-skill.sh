#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
skill_dir="$(cd -- "${script_dir}/.." && pwd)"

required_paths=(
  "${skill_dir}/SKILL.md"
  "${skill_dir}/scripts"
  "${skill_dir}/references"
  "${skill_dir}/assets"
)

for path in "${required_paths[@]}"; do
  if [[ ! -e "${path}" ]]; then
    printf 'Missing required path: %s\n' "${path}" >&2
    exit 1
  fi
done

skill_file="${skill_dir}/SKILL.md"
for field in name description; do
  if ! grep -Eq "^${field}:[[:space:]]*[^[:space:]].*$" "${skill_file}"; then
    printf 'SKILL.md is missing front matter field: %s\n' "${field}" >&2
    exit 1
  fi
done

while IFS= read -r -d '' script; do
  if [[ ! -x "${script}" ]]; then
    printf 'Script is not executable: %s\n' "${script}" >&2
    exit 1
  fi
done < <(find "${skill_dir}/scripts" -maxdepth 1 -type f -name '*.sh' -print0)

printf 'Skill validation passed: %s\n' "${skill_dir}"
