# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Rocky Linux 8.x and 9.x support (`tasks/install/rockylinux.yml`).
- Test matrix for AlmaLinux 8.x/9.x, Rocky Linux 8.x/9.x, Alpine 3.22/3.23,
  Debian 12/13, Fedora 43/44, Ubuntu 22.04/24.04/26.04.

### Changed

- Replaced the duplicated molecule test matrix in `ci.yml` and `release.yml`
  with a single source of truth in `.github/workflows/config.yml`.
- CI checks now use a stable `test-gate` job name, so branch protection rules
  no longer need updating when test versions change.
- Pinned `community.general` in `requirements.yml` to a version range
  compatible with the pinned ansible-core (`>=11.0.0,<12.0.0`); the latest
  12.x/13.x requires ansible-core >=2.17/2.18.
- Trimmed the molecule test sequence in `molecule/default/molecule.yml` to the
  used phases (drop dependency/prepare/cleanup/side_effect), silencing
  "missing playbook"/"missing requirements file" noise.

### Fixed

- Molecule tests for AlmaLinux, Rocky Linux and Fedora failing in CI on the
  first task with `sudo: PAM account management error`. Sudo is broken inside
  the systemd-based images under the rootless podman available on GitHub
  runners (PAM cannot retrieve authentication info in the user namespace),
  so the converge playbook now connects as the root user the podman driver
  already provides and no longer escalates via `become`, avoiding sudo
  altogether.

### Removed

- CentOS 8 support and the `geerlingguy/docker-centos8-ansible` test image.
- Tests for EOL Alpine 3.16–3.18 and Fedora 36–38 versions.