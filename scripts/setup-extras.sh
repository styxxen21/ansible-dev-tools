#!/bin/bash

# Install required packages
echo "Installing packages: podman, podman-docker, wget, bind-utils..."
dnf -y install podman podman-docker wget bind-utils ping glibc-langpack-en || true
pip3 install gh
echo "✅ Extra packages has been installed successfully!"

# Create MyNotes workspace structure ( for creating notes directly within VS Code)
echo "Setting up MyNotes workspace..."
mkdir -p /home/runner/github/MyNotes
echo "✅ MyNotes workspace setup completed successfully!"

# Install socat for port forwarding
echo "Installing socat..."
dnf -y install socat || true
echo "✅ socat has been installed successfully!"

# Set up port forwarding from host to container for port 11434
echo "Setting up port forwarding for port 11434..."
socat TCP-LISTEN:11434,fork TCP:host.docker.internal:11434 &
echo "✅ Port forwarding for port 11434 has been set up successfully!"
