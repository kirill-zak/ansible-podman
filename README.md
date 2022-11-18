# Ansible Podman

An Ansible role that installs the latest version of Podman

## Support distributive

* CentOS 8
* Debian 11 (Bullseye)
* Ubuntu 22.04 (Jammy Jellyfish)

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