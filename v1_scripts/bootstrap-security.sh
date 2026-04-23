#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SEC_DIR="${ROOT_DIR}/v1_configs/security"

echo "==> Security bootstrap checklist"

echo "1) Wazuh rule pack present?"
test -f "${SEC_DIR}/wazuh-rule-pack.yaml" && echo "   OK" || { echo "   Missing"; exit 1; }

echo "2) IAM baseline policy present?"
test -f "${SEC_DIR}/iam-policy-baseline.yaml" && echo "   OK" || { echo "   Missing"; exit 1; }

echo "3) pfSense template present?"
test -f "${SEC_DIR}/pfsense-rule-template.conf" && echo "   OK" || { echo "   Missing"; exit 1; }

echo
echo "Apply manually in target systems:"
echo " - Import/translate Wazuh rules into Wazuh manager"
echo " - Align IAM baseline in your IdP (Keycloak/Azure AD)"
echo " - Translate pfSense template into actual firewall rules via UI/API"
echo
echo "Security bootstrap checklist completed."