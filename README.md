# Ansible Podman

An Ansible role that installs the latest version of Podman

## Support distributive

* AlmaLinux `9.0`.
* Alpine Linux 3.16.x (`3.16.0`, `3.16.1`, `3.16.2`, `3.16.3`, `3.16.4`).
* Alpine Linux 3.17.x (`3.17.0`, `3.17.1`, `3.17.2`).
* Alpine Linux 3.18.x (`3.18.0`).
* CentOS `8`.
* Debian `11` (Bullseye).
* Fedora `36`, `37`, `38`.
* Ubuntu `22.04` (Jammy Jellyfish).

## Requirements

N/A

## Role Variables

* `podman_service_state`: Podman service state. Default value is `stopped`
* `podman_service_enabled`: Podman service enable status. Default value is `false`

## Dependencies

N/A

## Example Playbook

```yaml
- hosts: all
  become: true
  roles:
    - role: kirill_zak.podman
```

## License

GPLv2

## Author Information

https://kirill-zak.ru