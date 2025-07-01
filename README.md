#  Legacy Deployment Scripts

This repository contains legacy scripts used in the previous deployment process for the `legacy-inventory-app`. These scripts were originally managed manually by the infrastructure team before the migration to a centralized CI/CD system.

---

## 📁 Structure

- `deploy.sh` — Main deployment script used to push updates to the staging server.

---

## ⚠️ Disclaimer

These scripts are no longer maintained and were only intended for internal staging environments. They may contain:

- Hardcoded IP addresses
- Insecure configurations
- Deprecated deployment logic

> **Warning:** Some scripts may contain leftover credentials that were hardcoded temporarily during emergencies. Please do not use or expose these credentials in public or production environments.

---

## 🔐 Security Note

The repository is preserved for forensic and internal documentation purposes only. Migration to Ansible and vault-managed secrets was completed in Q1 2025. Any use of these scripts is strictly discouraged.

---

## 📝 References

- Original author: `deploy@acme.local`
- Migration issue tracker: `#INFRA-112`

For questions, contact the DevOps team at `devops@acme.local`.
