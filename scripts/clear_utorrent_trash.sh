#!/usr/bin/env bash
#
# Empty the uTorrent snap trash directory so it does not fill $HOME.

set -euo pipefail

TARGET="${HOME}/snap/utorrent/102/.local/share/Trash/files"

if [[ ! -d "${TARGET}" ]]; then
  printf 'uTorrent trash directory does not exist: %s\n' "${TARGET}"
  exit 0
fi

# Refuse to run if TARGET somehow resolves to "/" or HOME for safety.
if [[ "${TARGET}" == "/" || "${TARGET}" == "${HOME}" ]]; then
  printf 'Refusing to remove contents of %s (safety check failed)\n' "${TARGET}"
  exit 1
fi

if [[ -z "$(ls -A "${TARGET}")" ]]; then
  printf 'uTorrent trash already empty at %s\n' "${TARGET}"
  exit 0
fi

before_size="$(du -sh "${TARGET}" | cut -f1)"
printf 'Removing %s from %s\n' "${before_size}" "${TARGET}"

find "${TARGET}" -mindepth 1 -maxdepth 1 -exec rm -rf {} +

printf 'Done. Directory now uses %s\n' "$(du -sh "${TARGET}" | cut -f1)"
