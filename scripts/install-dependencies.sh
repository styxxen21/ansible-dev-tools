#!/usr/bin/env bash
# Update resolv.conf
echo "nameserver 10.244.0.15 \n nameserver 10.244.0.20" > /etc/resolv.conf
# WORKSPACE="/workspaces/ansible-dev-tools"
# BINDEP="$WORKSPACE/bindep.txt"
# export DEBIAN_FRONTEND=noninteractive
# $SUDO apt-get update -y

dnf install $(cat /workspaces/ansible-dev-tools/bindep.txt) -y

# Install packages listed in bindep.txt (ignore comments/blank lines)
# if [ -f "$BINDEP" ]; then
#   PKGS=$(grep -E -v '^\s*(#|$)' "$BINDEP" || true)
#   if [ -n "$PKGS" ]; then
#     echo "Installing system packages from $BINDEP"
#     $SUDO apt-get install -y $PKGS || echo "Warning: apt-get install returned non-zero"
#   else
#     echo "No packages listed in $BINDEP"
#   fi
# else
#   echo "No $BINDEP found; skipping system package install"
# fi

# Configure git
# git config --global user.name styxxen21
# git config --global user.email knolfal1@volvocars.com
# mkdir -p /workspaces/github/styxxen21
# mkdir -p /workspaces/github/volvo-cars
# Install Ansible Collections and Python packages
ansible-galaxy collection install azure.azcollection
pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt --no-input
pip install -r /workspaces/ansible-dev-tools/scripts/requirements.txt
# Install Azure CLI via pip to get the latest version
pip install azure-cli --upgrade
curl -fsSL https://aka.ms/install-azd.sh | bash
azd auth login
az config set core.login_experience_v2=off
az login

# Install/Configure user related settings and dependencies
/bin/bash "/workspaces/ansible-dev-tools/scripts/configure-git.sh"
/bin/bash "/workspaces/ansible-dev-tools/scripts/setup-extras.sh"
# git clone https://github.com/styxxen21/Hosting-Ansible-Playbooks /workspaces/github/styxxen21/Hosting-Ansible-Playbooks
# git clone https://github.com/styxxen21/Hosting-Ansible-Collections /workspaces/github/styxxen21/Hosting-Ansible-Collections
# git clone https://github.com/volvo-cars/Hosting-Database-Playbooks /workspaces/github/volvo-cars/Hosting-Database-Playbooks
# git clone https://github.com/volvo-cars/Hosting-Ansible-Actions /workspaces/github/volvo-cars/Hosting-Ansible-Actions
# git clone https://github.com/volvo-cars/Hosting-Ansible-TestArea /workspaces/github/volvo-cars/Hosting-Ansible-TestArea
# git clone https://github.com/volvo-cars/Hosting-Ansible-DummyRepo /workspaces/github/volvo-cars/Hosting-Ansible-DummyRepo
# /bin/bash "/workspaces/ansible-dev-tools/scripts/update-ansible-config.sh"
# ansible-galaxy collection install -r /workspaces/github/styxxen21/Hosting-Ansible-Playbooks/requirements.yml
# ansible-galaxy collection install /workspaces/github/styxxen21/Hosting-Ansible-Playbooks/collections/hosting_internal
# pip install -r ~/.ansible/collections/ansible_collections/vmware/vmware/requirements.txt --no-input
