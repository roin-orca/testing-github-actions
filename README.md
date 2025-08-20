# testing-github-actions

## ⚠️ Security Vulnerability Demonstration

This repository contains a **deliberately vulnerable** GitHub Actions workflow that demonstrates how `pull_request_target` can be exploited to expose repository secrets.

### 🔴 Vulnerability Overview

The workflow `.github/workflows/vulnerable-pr-target.yml` contains multiple security flaws:

1. **Direct Secret Logging**: Prints secrets directly to workflow logs
2. **Environment Variable Exposure**: Exposes secrets via `env` command
3. **Malicious Code Execution**: Executes code from PR with secrets in environment
4. **API Secret Leakage**: Sends secrets to external services
5. **PR Comment Exposure**: Posts secrets as comments on pull requests

### 🎯 Attack Vector

An external contributor can:
1. Fork this repository
2. Create a pull request that includes `malicious-script.sh`
3. The `pull_request_target` trigger will execute with repository secrets
4. Secrets (SECRET_1, SECRET_2, SECRET_3) will be exposed in multiple ways

### 🛡️ How to Prevent This

**Never do this in production:**
- Don't use `pull_request_target` unless absolutely necessary
- Never expose secrets in logs, comments, or environment variables
- Don't execute code from untrusted PRs with access to secrets
- Use `pull_request` trigger instead for external contributions
- If you must use `pull_request_target`, validate and sanitize all inputs

### 📚 Educational Purpose

This repository is for educational purposes to demonstrate:
- Why `pull_request_target` is dangerous
- How secrets can be accidentally exposed
- The importance of secure CI/CD practices

**⚠️ Do not use this workflow pattern in real projects!**