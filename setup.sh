#!/usr/bin/env bash

SCRIPT_DIR="$PWD/$(dirname "${BASH_SOURCE[0]}")"

check_and_clone_repos() {
    [ -d "./django-orchestration" ] && echo "Django Orchestration exists! Skipping clone ..." || git clone git@github.com:spectrum-dev/django-orchestration.git
    [ -d "./django-block-monolith" ] && echo "Django Block Monolith exists! Skipping clone ..." || git clone git@github.com:spectrum-dev/django-block-monolith.git
    [ -d "./next-client" ] && echo "Client exists! Skipping clone ..." || git clone git@github.com:spectrum-dev/next-client.git
}

cd "${SCRIPT_DIR}/.."
echo "---"

check_and_clone_repos

echo "Completed setup!"