<!-- cspell:disable-next-line -->

# Ansible Development Tools (ADT)

The `ansible-dev-tools` python package provides an easy way to install and discover the best tools available to create and test ansible content.

The curated list of tools installed as part of the Ansible automation developer tools package includes:

[ansible-core](https://github.com/ansible/ansible): Ansible is a radically simple IT automation platform that makes your applications and systems easier to deploy and maintain. Automate everything from code deployment to network configuration to cloud management, in a language that approaches plain English, using SSH, with no agents to install on remote systems.

[ansible-builder](https://github.com/ansible/ansible-builder): a utility for building Ansible execution environments.

[ansible-creator](https://github.com/ansible/ansible-creator): a utility for scaffolding Ansible projects and content with leading practices.

[ansible-lint](https://github.com/ansible/ansible-lint): a utility to identify and correct stylistic errors and anti-patterns in Ansible playbooks and roles.

[ansible-navigator](https://github.com/ansible/ansible-navigator) a text-based user interface (TUI) for developing and troubleshooting Ansible content with execution environments.

[ansible-sign](https://github.com/ansible/ansible-sign): a utility for signing and verifying Ansible content.

[molecule](https://github.com/ansible/molecule): Molecule aids in the development and testing of Ansible content: collections, playbooks and roles

[pytest-ansible](https://github.com/ansible/pytest-ansible): a pytest testing framework extension that provides additional functionality for testing Ansible module and plugin Python code.

[tox-ansible](https://github.com/ansible/tox-ansible): an extension to the tox testing utility that provides additional functionality to check Ansible module and plugin Python code under different Python interpreters and Ansible core versions.

[ansible-dev-environment](https://github.com/ansible/ansible-dev-environment): a utility for building and managing a virtual environment for Ansible content development.

## Communication

Refer to our [Communication guide](https://ansible.readthedocs.io/projects/dev-tools/contributor-guide/#talk-to-us) for details.

## Installation

`python3 -m pip install ansible-dev-tools`

A VsCode compatible devcontainer is also available which is a great way to develop ansible content. The image name is [community-ansible-dev-tools](https://ansible.readthedocs.io/projects/dev-tools/container/).

## Usage

In addition to installing each of the above tools, `ansible-dev-tools` provides an easy way to show the versions of the content creation tools that make up the current development environment.
