# Ansible venv location
VENV_DIR ?= .ansible

# Python interpreter used to create the venv
PYTHON ?= python3

# File with Python dependencies
REQUIREMENTS ?= requirements.txt

# Create the virtual environment and install dependencies
create-venv:
	$(PYTHON) -m venv $(VENV_DIR)
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install -r $(REQUIREMENTS)

# Update installed packages to the latest versions within the venv
update-venv:
	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install --upgrade -r $(REQUIREMENTS)

# Open a new interactive shell with the venv declared on PATH.
# This mimics "source $(VENV_DIR)/bin/activate", but works from make:
# recipes run in a subshell, so the environment cannot be changed in the
# calling shell. Exit the spawned shell with 'exit' to return.
activate:
	@test -x "$(VENV_DIR)/bin/ansible" || { echo "'$(VENV_DIR)' venv not found, run 'make create-venv' first" >&2; exit 1; }
	@export PATH="$(CURDIR)/$(VENV_DIR)/bin:$$PATH"; \
	echo "Activated $(VENV_DIR) venv. Type 'exit' to leave."; \
	exec "$$SHELL"

.PHONY: create-venv update-venv activate