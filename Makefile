.DEFAULT_GOAL := help

FLAKE  ?= .
HOST   ?= nixos-vm
TARGET := $(FLAKE)\#$(HOST)

.PHONY: help switch build preview update update-input check fmt clean

help: ## Show available targets
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  %-12s %s\n", $$1, $$2}'

switch: ## Build and activate the system configuration
	sudo nixos-rebuild switch --flake $(TARGET)

build: ## Build the system without activating it
	sudo nixos-rebuild build --flake $(TARGET)

preview: ## Build and show package changes against the current system
	sudo nixos-rebuild build --flake $(TARGET)
	nix store diff-closures /run/current-system ./result

update: ## Update all flake inputs
	nix flake update

update-input: ## Update one input (usage: make update-input INPUT=nixpkgs)
	nix flake update $(INPUT)

check: ## Check flake evaluation and outputs
	nix flake check

fmt: ## Format Nix files (requires nixfmt in PATH)
	nixfmt .

clean: ## Remove the local build result symlink
	rm -f result

list-generations: ## List existing generations
	sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

garbage-collect: ## Delete generations older than 7d
	sudo nix-env --delete-generations +2 --profile /nix/var/nix/profiles/system
	sudo nixos-rebuild boot --flake $(TARGET)
