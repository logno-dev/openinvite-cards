#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s <name>\n' "${0##*/}" >&2
}

if [[ ${#} -ne 1 ]]; then
  usage
  exit 1
fi

name="$1"
if [[ -z "${name}" ]]; then
  usage
  exit 1
fi

base_file="base.html"
cards_dir="cards"
target_file="${cards_dir}/${name}.html"

if [[ ! -f "${base_file}" ]]; then
  printf 'Error: %s not found\n' "${base_file}" >&2
  exit 1
fi

if [[ ! -d "${cards_dir}" ]]; then
  printf 'Error: %s directory not found\n' "${cards_dir}" >&2
  exit 1
fi

if [[ -e "${target_file}" ]]; then
  printf 'Error: %s already exists\n' "${target_file}" >&2
  exit 1
fi

cp "${base_file}" "${target_file}"
printf 'Created %s\n' "${target_file}"
