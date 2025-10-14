#!/bin/bash

# Install required packages
echo "Installing packages: podman, podman-docker, wget, bind-utils..."
dnf -y install podman podman-docker wget bind-utils || true

# Create MyNotes workspace structure ( for creating notes directly within VS Code)
echo "Setting up MyNotes workspace..."
mkdir -p /home/runner/github/MyNotes
