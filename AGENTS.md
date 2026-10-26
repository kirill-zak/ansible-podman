# AGENTS.md

Guidance for AI coding agents working in this repository.

## Project overview

- **What:** An Ansible role that installs the latest version of Podman.
- **Identity:** Galaxy role FQCN is `kirill_zak.podman` (declared in `meta/main.yml`).
- **Language:** Docs, comments and commit messages in English. Code is YAML (Ansible).
- **Status:** Strictly linted — do not introduce lint warnings or failures.

## Repository layout

- `tasks/main.yml` — entry point; includes distro-specific files from `tasks/install/` based
  on `ansible_distribution`, then runs `tasks/post_process.yml` (podman service state).
- `defaults/main.yml` — role variables (`podman_service_state`, `podman_service_enabled`).
- `handlers/main.yml`, `vars/main.yml` — empty skeletons (kept per role standard).
- `meta/main.yml` — Galaxy metadata (`namespace`, `role_name`, platforms, tags).
- `molecule/default/` — integration tests (converge + verify against multiple distros in CI).
- `tests/` — simple playbook test; `tests/roles/podman` is a **symlink** to the repo root —
  do not replace it with a real directory.
- `scripts/*.mk` — Makefile fragments (infra, molecule). `scripts/infra.mk` owns the venv.

## Environment

The Python virtualenv lives in `.ansible/` (gitignored):

```console
make create-venv     # create venv + install requirements.txt
make update-venv     # update packages to pinned versions
make activate        # spawn a new shell with the venv on PATH
make test-molecule   # run molecule test for the default scenario
```

Use binaries directly when not activating: `.ansible/bin/ansible-lint`, `.ansible/bin/yamllint`,
`.ansible/bin/molecule`. `requirements.txt` pins exact tool versions (ansible, ansible-lint,
molecule, molecule-plugins[podman], yamllint); keep pinning when adding tools.

## Linting (must pass before finishing any change)

```console
.ansible/bin/yamllint .
.ansible/bin/ansible-lint .
```

- `ansible-lint` runs with `profile: production` and **no** rule skips — keep it that way.
- Every module/action must use FQCN (`ansible.builtin.*`, `community.general.*`); never
  bare `include_tasks:`/`include_role:`/`package:` names.
- `.yamllint` disables line-length/trailing-spaces/indentation, but enforces
  `comments.min-spaces-from-content: 1` and octal quoting; the `.ansible/` venv is ignored.
- Don't add files under `.ansible/` (the venv) and don't let the venv leak into diffs.

## Molecule tests

```console
export PATH="$PWD/.ansible/bin:$PATH"
make test-molecule
# or with an explicit base image:
make test-molecule MOLECULE_DISTR=kirillzak/docker-almalinux-ansible MOLECULE_TAG=9.2
```

Scenario config is `molecule/default/molecule.yml`; expect containers running on the podman
driver (the podman driver must be available in the local environment).

## Role conventions

- Keep the standard role skeleton: `defaults/`, `handlers/`, `meta/`, `tasks/`, `tests/`, `vars/`.
- Add a per-distro install file in `tasks/install/` when supporting a new OS and wire it in
  `tasks/main.yml`; also declare the platform in `meta/main.yml` and `README.md`.
- Check that a new platform is covered by the CI matrix in `.github/workflows/ci.yml`.
- Service tasks use `changed_when: false` where appropriate (they are not idempotency checks).
- Keep `CHANGELOG.md` in Keep a Changelog format; add entries under `[Unreleased]`.

## CI

- `.github/workflows/ci.yml` — lint + molecule matrix (AlmaLinux, Alpine, CentOS, Debian,
  Fedora, Ubuntu) on pull requests and pushes to `master`.
- `.github/workflows/lint.yml` — reusable lint job (`yamllint .` + `ansible-lint .`).
- `.github/workflows/release.yml` — publishes the role to Ansible Galaxy on `x.x.x`/`vx.x.x`
  tags; keep `meta/main.yml` in sync so the Galaxy import name stays `kirill_zak.podman`.