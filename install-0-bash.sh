#!/usr/bin/env bash
set -euo pipefail

if (( $# > 1 )); then
  printf 'Usage: %s [skills-directory]\n' "${0##*/}" >&2
  exit 2
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_dir="${script_dir}/0-bash"

if (( $# == 1 )); then
  skills_dir=$1
elif [[ -n "${CODEX_HOME:-}" ]]; then
  skills_dir="${CODEX_HOME}/skills"
elif [[ -n "${HOME:-}" ]]; then
  skills_dir="${HOME}/.codex/skills"
else
  printf 'Error: set CODEX_HOME or HOME, or pass the skills directory.\n' >&2
  exit 1
fi

destination="${skills_dir}/0-bash"

if [[ ! -f "${source_dir}/SKILL.md" ]]; then
  printf 'Error: skill source not found at %s\n' "${source_dir}" >&2
  exit 1
fi

if [[ -e "${destination}" || -L "${destination}" ]]; then
  printf 'Error: destination already exists at %s\n' "${destination}" >&2
  exit 1
fi

mkdir -p -- "${skills_dir}"
cp -R -- "${source_dir}" "${destination}"

printf 'Installed 0-bash at %s\n' "${destination}"
printf 'Restart Codex to load the skill.\n'
