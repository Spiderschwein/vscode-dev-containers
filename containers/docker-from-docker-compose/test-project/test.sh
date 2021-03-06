#!/bin/bash
cd $(dirname "$0")

source test-utils.sh vscode

# Run common tests
checkCommon

# Run Docker init script
/usr/local/share/docker-init.sh

# Definition specific tests
checkExtension "ms-azuretools.vscode-docker"
check "docker" docker ps -a
check "docker-compose" docker-compose --version

# Report result
reportResults
