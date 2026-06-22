#!/usr/bin/env bash
set -eu

DEV_HUB="${1:?Usage: $0 <dev-hub> <target-org>}"
TARGET_ORG="${2:?Usage: $0 <dev-hub> <target-org>}"

for pkg in core catalog-management reservation-management billing-management; do
  echo "Creating $pkg..."

  output=$(sf package version create --package "$pkg" --installation-key-bypass --wait 30 --code-coverage --target-dev-hub "$DEV_HUB" --json 2>/dev/null || true)
  version=$(echo "$output" | jq -r '.result.SubscriberPackageVersionId')

  if [[ -z "$version" || "$version" == "null" ]]; then
    echo "Failed to create $pkg:" >&2
    echo "$output" | jq -r '.message' >&2
    exit 1
  fi

  echo "Installing $pkg ($version)..."
  sf package install --package "$version" --target-org "$TARGET_ORG" --wait 20 --publish-wait 10

  echo "Promoting $pkg ($version)..."
  sf package version promote --package "$version" --target-dev-hub "$DEV_HUB" --no-prompt
done
