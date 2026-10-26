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
| AlmaLinux    | 9.0, 9.1, 9.2 |
| Alpine Linux | 3.16.x (`3.16.0`–`3.16.5`), 3.17.x (`3.17.0`–`3.17.3`), 3.18.x (`3.18.0`) |
| CentOS       | 8 |
| Debian       | 11 (Bullseye) |
| Fedora       | 36, 37, 38 |
| Ubuntu       | 22.04 (Jammy Jellyfish) |

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