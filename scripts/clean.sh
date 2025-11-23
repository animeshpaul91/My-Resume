#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Re-running with sudo to ensure cached files can be removed..."
  exec sudo "$0" "$@"
fi

TARGET_USER=${SUDO_USER:-root}
TARGET_HOME=$(getent passwd "$TARGET_USER" | cut -d: -f6)

if [[ -z "$TARGET_HOME" || ! -d "$TARGET_HOME" ]]; then
  echo "Could not determine home directory for $TARGET_USER" >&2
  exit 1
fi

log() {
  printf '%s\n' "$1"
}

prune_dir() {
  local path="$1"
  if [[ -e "$path" ]]; then
    local size
    size=$(du -sh "$path" 2>/dev/null | awk '{print $1}')
    rm -rf "$path"
    log "Removed $path (${size:-size unknown})"
  else
    log "Skipped $path (not found)"
  fi
}

TARGETS=(
  "$TARGET_HOME/.cache/google-chrome"
  "$TARGET_HOME/.cache/JetBrains"
  "$TARGET_HOME/.config/google-chrome/Default/Cache"
  "$TARGET_HOME/.config/google-chrome/Default/Code Cache"
  "$TARGET_HOME/.config/google-chrome/Default/GPUCache"
  "$TARGET_HOME/.config/google-chrome/Default/ShaderCache"
  "$TARGET_HOME/.config/google-chrome/Default/Service Worker/CacheStorage"
  "$TARGET_HOME/.config/google-chrome/GrShaderCache"
  "$TARGET_HOME/.config/google-chrome/ShaderCache"
  "$TARGET_HOME/.config/google-chrome/screen_ai"
  "$TARGET_HOME/.config/google-chrome/OptGuideOnDeviceModel"
  "$TARGET_HOME/.config/google-chrome/component_crx_cache"
  "$TARGET_HOME/.config/google-chrome/extensions_crx_cache"
  "$TARGET_HOME/.gradle/caches"
  "$TARGET_HOME/.gradle/daemon"
  "$TARGET_HOME/.gradle/.tmp"
  "$TARGET_HOME/.gradle/wrapper/dists"
  "$TARGET_HOME/.npm"
  "$TARGET_HOME/.docker/desktop/vms"
)

log "Cleaning cached data for user $TARGET_USER in $TARGET_HOME"

for dir in "${TARGETS[@]}"; do
  prune_dir "$dir"
done

log "Disk usage after cleanup:"
disk

