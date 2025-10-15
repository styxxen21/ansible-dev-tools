#!/usr/bin/env bash
# Update resolv.conf
echo "nameserver 10.244.0.15 \n nameserver 10.244.0.20" > /etc/resolv.conf
WORKSPACE="/home/runner/github/ansible-dev-tools"
# Update system and install dependencies
echo "🔄 Updating system and installing dependencies..."
dnf install $(cat $WORKSPACE/bindep.txt) -y

# Install Ansible Collections and Python packages
ansible-galaxy collection install azure.azcollection
pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt --no-input
pip install -r $WORKSPACE/scripts/requirements.txt

# Install Azure CLI via pip to get the latest version
pip install azure-cli --upgrade
curl -fsSL https://aka.ms/install-azd.sh | bash
azd auth login
az config set core.login_experience_v2=off
az login

# Install/Configure user related settings and dependencies
/bin/bash "$WORKSPACE/scripts/configure-git.sh"
/bin/bash "$WORKSPACE/scripts/setup-extras.sh"

# /bin/bash "$WORKSPACE/scripts/update-ansible-config.sh"

# pip install -r ~/.ansible/collections/ansible_collections/vmware/vmware/requirements.txt --no-input
