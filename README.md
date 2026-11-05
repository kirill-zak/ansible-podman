# Ansible Podman

An Ansible role that installs the latest version of Podman.

[![CI workflow](https://github.com/kirill-zak/ansible-podman/actions/workflows/ci.yml/badge.svg)](https://github.com/kirill-zak/ansible-podman/actions/workflows/ci.yml)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-kirill_zak.podman-660198.svg)](https://galaxy.ansible.com/kirill_zak/podman)

## Installation

Install the role from Ansible Galaxy:

```console
$ ansible-galaxy role install kirill_zak.podman
```

Or add it to your `requirements.yml`:

```yaml
---
roles:
  - name: kirill_zak.podman
```

## Supported platforms

| Distribution | Versions |
| ------------ | -------- |
| AlmaLinux    | 8.5–8.10, 9.0–9.8 |
| Alpine Linux | 3.22.x (`3.22.0`–`3.22.4`), 3.23.x (`3.23.0`–`3.23.4`) |
| Debian       | 12 (Bookworm), 13 (Trixie) |
| Fedora       | 43, 44 |
| Rocky Linux  | 8.5–8.9, 9.0–9.8 |
| Ubuntu       | 22.04 (Jammy Jellyfish), 24.04 (Noble Numbat), 26.04 (Resolute Raccoon) |

## Requirements

* Ansible core 2.16 or newer.

## Role Variables

| Variable | Description | Default |
| -------- | ----------- | ------- |
| `podman_service_state` | Podman service state | `stopped` |
| `podman_service_enabled` | Podman service enable status | `false` |

## Dependencies

N/A

## Example Playbook

```yaml
---
- hosts: all
  become: true
  roles:
    - role: kirill_zak.podman
```

## License

GPL-2.0-or-later

## Author Information

https://kirill-zak.ru