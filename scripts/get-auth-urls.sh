#!/usr/bin/env bash
set -eu

echo "DEV_HUB_SFDX_AUTH_URL:"
sf org display --target-org zaclummys@brave-hawk-otbxo5.com --verbose --json | jq -r '.result.sfdxAuthUrl'

echo ""
echo "QA_SFDX_AUTH_URL:"
sf org display --target-org pkg-install-scratch --verbose --json | jq -r '.result.sfdxAuthUrl'

echo ""
echo "PRODUCTION_SFDX_AUTH_URL:"
sf org display --target-org production-scratch --verbose --json | jq -r '.result.sfdxAuthUrl'
