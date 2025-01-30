#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_NAME = desktop-goose-payload
PYTHON_VERSION = 3.12
PYTHON_INTERPRETER = python
DOCS_PORT ?= 8000


.PHONY: payload
payload: ## Run payload script
	bash ./desktop_goose_payload/install.sh

.PHONY: payload-remote
payload-remote: ## Run payload script but from remote repo
	curl -sSL https://raw.githubusercontent.com/GatlenCulp/Desktop-Goose-Payload/main/desktop_goose_payload/install.sh | bash

.PHONY: kill
kill: ## Kill the desktop goose
	bash ./desktop_goose_payload/kill.sh

#################################################################################
# UTILITIES                                                                     #
#################################################################################

_prep: ## Clean up .DS_Store files
	rm -f **/*/.DS_store

_welcome: ## Print a Welcome screen
	curl -s https://raw.githubusercontent.com/GatlenCulp/gatlens-opinionated-template/vscode-customization/welcome.txt

#################################################################################
# PACKAGE COMMANDS                                                              #
#################################################################################

.PHONY: create_environment
create_environment: ## Set up python interpreter environment
	uv venv
	@echo ">>> New virtualenv with uv created. Activate with:\nsource '.venv/bin/activate'"



.PHONY: requirements
requirements: ## Install Python Dep
	
	uv sync
	


publish-all: format lint publish docs-publish ## Run format, lint, publish package and docs

#################################################################################
# CLEAN COMMANDS                                                                #
#################################################################################


.PHONY: clean
clean: ## Delete all compiled Python files and Desktop Goose installation files
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete
	rm -rf "/tmp/Desktop Goose.app"
	rm -f "/tmp/desktop-goose.zip"
	rm -f "/tmp/Read me! Honk.rtf"


.PHONY: lint ## Lint using ruff (use `make format` to do formatting)
lint:
	ruff check --config pyproject.toml desktop_goose_payload


.PHONY: format ## Format source code with black
format:
	ruff --config pyproject.toml desktop_goose_payload

#################################################################################
# DOCS COMMANDS                                                                 #
#################################################################################

# Switched to using uv
docs-serve: ## Serve documentation locally on port $(DOCS_PORT)
	cd docs && \
	mkdocs serve -a localhost:$(DOCS_PORT) || \
	echo "\n\nInstance found running on $(DOCS_PORT), try killing process and rerun."

# Makes sure docs can be served prior to actually deploying
docs-publish: ## Build and deploy documentation to GitHub Pages
	cd docs && \
	mkdocs build && \
	mkdocs gh-deploy --clean

#################################################################################
# DATA COMMANDS                                                                 #
#################################################################################

#################################################################################
# TEST COMMANDS                                                                 #
#################################################################################

# test: _prep ## Run all tests
# 	pytest -vvv --durations=0

test: ## Run BATS tests
	bats tests --verbose-run

test-fastest: _prep ## Run tests with fail-fast option
	pytest -vvv -FFF

# Requires pytest-watcher (Continuous Testing for Fast Tests)
test-continuous: _prep ## Run tests in watch mode using pytest-watcher
	ptw . --now --runner pytest --config-file pyproject.toml -vvv -FFF

test-debug-last: ## Debug last failed test with pdb
	pytest --lf --pdb

_clean_manual_test:
	rm -rf manual_test

#################################################################################
# PROJECT RULES                                                                 #
#################################################################################

.PHONY: data ## Make Dataset
data: requirements
	$(PYTHON_INTERPRETER) desktop_goose_payload/dataset.py

#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := help

help:  ## Show this help message
	@echo "\033[38;5;39m   ____  ___ _____              "
	@echo "  / ___|/ _ \_   _|__ _ __ ___  "
	@echo " | |  _| | | || |/ _ \ '_ \` _ \ "
	@echo " | |_| | |_| || |  __/ | | | | |"
	@echo "  \____|\___/ |_|\___|_| |_| |_|\033[0m"
	@echo "\n\033[1m~ Available rules: ~\033[0m\n"
	@echo "For VSCode/Cursor, try: ⇧ ⌘ P, Tasks: Run Task\n"
	@grep -E '^[a-zA-Z][a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[38;5;222m%-30s\033[0m %s\n", $$1, $$2}'
