# Ansible Starter (Kubric FYP)

This folder provides a baseline Ansible structure for host hardening and runtime package setup.

## Files

- `inventory.ini`: sample inventory
- `site.yml`: entry playbook
- `roles/common/tasks/main.yml`: baseline OS and package tasks

## Usage

```bash
ansible-playbook -i inventory.ini site.yml
```

Adjust package names and services for your operating system.
