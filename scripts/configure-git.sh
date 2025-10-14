#!/usr/bin/env bash

# # Configure git
# git config --global user.name styxxen21
# git config --global user.email knolfal1@volvocars.com
# mkdir -p /workspaces/github/styxxen21
# mkdir -p /workspaces/github/volvo-cars
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


# Configure git with user-specific settings
# This script sets up git configuration and clones necessary repositories

# Set default values if environment variables are not provided
GIT_USERNAME="${GIT_USERNAME:-styxxen21}"
GIT_EMAIL="${GIT_EMAIL:-knolfal1@volvocars.com}"
GITHUB_USER="${GITHUB_USER:-${GIT_USERNAME}}"
WORKSPACE_BASE="${WORKSPACE_BASE:-/workspaces/github}"

# Validate required variables
if [[ -z "$GIT_USERNAME" || -z "$GIT_EMAIL" ]]; then
    echo "❌ Error: GIT_USERNAME and GIT_EMAIL must be set"
    echo "Usage: GIT_USERNAME=your-username GIT_EMAIL=your-email@volvocars.com $0"
    exit 1
fi

# Configure git with user-specific settings
echo "🔧 Configuring git for user: $GIT_USERNAME"
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

# Create workspace directories
echo "📁 Creating workspace directories..."
mkdir -p "$WORKSPACE_BASE/$GITHUB_USER"
mkdir -p "$WORKSPACE_BASE/volvo-cars"

# Clone personal repositories
echo "📥 Cloning personal repositories for $GITHUB_USER..."
git clone "https://github.com/$GITHUB_USER/Hosting-Ansible-Playbooks" "$WORKSPACE_BASE/$GITHUB_USER/Hosting-Ansible-Playbooks"
git clone "https://github.com/$GITHUB_USER/Hosting-Ansible-Collections" "$WORKSPACE_BASE/$GITHUB_USER/Hosting-Ansible-Collections"

# Clone organization repositories
echo "📥 Cloning Volvo Cars organization repositories..."
git clone "https://github.com/volvo-cars/Hosting-Database-Playbooks" "$WORKSPACE_BASE/volvo-cars/Hosting-Database-Playbooks"
git clone "https://github.com/volvo-cars/Hosting-Ansible-Actions" "$WORKSPACE_BASE/volvo-cars/Hosting-Ansible-Actions"
git clone "https://github.com/volvo-cars/Hosting-Ansible-TestArea" "$WORKSPACE_BASE/volvo-cars/Hosting-Ansible-TestArea"
git clone "https://github.com/volvo-cars/Hosting-Ansible-DummyRepo" "$WORKSPACE_BASE/volvo-cars/Hosting-Ansible-DummyRepo"

# Update ansible configuration
echo "⚙️ Updating Ansible configuration..."
/bin/bash "/workspaces/ansible-dev-tools/scripts/update-ansible-config.sh"

# Install ansible collections
echo "📦 Installing Ansible collections..."
ansible-galaxy collection install -r "$WORKSPACE_BASE/$GITHUB_USER/Hosting-Ansible-Playbooks/requirements.yml"
ansible-galaxy collection install "$WORKSPACE_BASE/$GITHUB_USER/Hosting-Ansible-Playbooks/collections/hosting_internal"

# Install python requirements
echo "🐍 Installing Python requirements..."
pip install -r ~/.ansible/collections/ansible_collections/vmware/vmware/requirements.txt --no-input

echo "✅ Git configuration and repository setup completed successfully!"
