#!/bin/bash

# Install required packages
echo "Installing packages: podman, podman-docker, wget, bind-utils..."
dnf -y install podman podman-docker wget bind-utils || true

# Create Foam workspace structure
echo "Setting up Foam workspace..."
mkdir -p /home/runner/github/notes/{daily,projects,snippets,todos,ansible,encrypted}
cd /home/runner/github/notes || exit 1

# Initialize git repository
git init --quiet || true

# Create .vscode and .foam directories
mkdir -p .vscode .foam/templates

# Create VS Code settings for Foam
cat > .vscode/settings.json << 'EOF'
{
  "foam.edit.linkReferenceDefinitions": "withExtensions",
  "foam.openDailyNote.directory": "daily",
  "foam.openDailyNote.titleFormat": "yyyy-mm-dd",
  "editor.minimap.enabled": false,
  "editor.wrapping": "word",
  "editor.wordWrap": "bounded",
  "editor.wordWrapColumn": 80,
  "editor.lineNumbers": "off",
  "editor.quickSuggestions": false,
  "editor.fontFamily": "Monaco, Consolas, monospace",
  "editor.fontSize": 14,
  "markdown.extension.toc.updateOnSave": true
}
EOF

# Create main README
cat > readme.md << 'EOF'
# My Knowledge Base 🧠

Welcome to my personal knowledge management system using Foam!

## Quick Navigation 🧭

- [[daily/daily-notes]] - Daily notes and journal
- [[projects/project-index]] - Project documentation
- [[ansible/ansible-notes]] - Ansible playbooks and snippets
- [[snippets/code-snippets]] - Reusable code blocks
- [[todos/task-management]] - Task tracking

## Features ✨

- **Bi-directional linking**: [[Link to other notes]]
- **Graph visualization**: See connections between notes
- **Daily notes**: Quick journal entries
- **Search**: Full-text search across all notes

## Getting Started 🚀

1. Press Ctrl+Shift+P and type "Foam: Show Graph"
2. Create new notes with Ctrl+Shift+P → "Foam: Create New Note"
3. Link notes using [[note-name]] syntax

---
*Created with ❤️ using Foam in VS Code devcontainer*
EOF

# Create daily note template
cat > .foam/templates/daily-note.md << 'EOF'
# Daily Note - ${FOAM_DATE_YEAR}-${FOAM_DATE_MONTH}-${FOAM_DATE_DATE}

## Today's Focus 🎯

- [ ]
- [ ]
- [ ]

## Notes 📝



## Links 🔗

- [[${FOAM_DATE_YEAR_PREVIOUS}-${FOAM_DATE_MONTH_PREVIOUS}-${FOAM_DATE_DATE_PREVIOUS}]] ← Yesterday
- [[${FOAM_DATE_YEAR_NEXT}-${FOAM_DATE_MONTH_NEXT}-${FOAM_DATE_DATE_NEXT}]] → Tomorrow

## Tags

#daily #journal
EOF

# Create Ansible playbook template
cat > .foam/templates/ansible-playbook.md << 'EOF'
# Playbook: ${FOAM_TITLE}

## Overview 📋

**Purpose**:
**Target Hosts**:
**Variables Required**:

## Playbook Structure 🏗️

```yaml
# Brief playbook snippet or link
```

## Variables 📝

| Variable | Type | Required | Description |
|----------|------|----------|-------------|
| `VariableName` | string | yes | Description |

## Usage Examples 💡

```bash
ansible-playbook -i inventory playbook.yml -e "Variable=value"
```

## Related Notes 🔗

- [[ansible/ansible-best-practices]]
- [[projects/project-name]]

## Tags

#ansible #playbook #automation
EOF

# Create initial index files
cat > daily/daily-notes.md << 'EOF'
# Daily Notes Index

## Recent Entries

- Create your first daily note with Ctrl+Shift+P → "Foam: Open Daily Note"

## Navigation

Back to [[readme]]

#index #daily
EOF

cat > ansible/ansible-notes.md << 'EOF'
# Ansible Documentation Index

## Playbooks

- [[ansible/playbook-templates]] - Common playbook patterns
- [[ansible/best-practices]] - Ansible best practices

## Collections

- Document your custom collections here

## Back to [[readme]]

#ansible #index
EOF

echo "✅ Foam workspace initialized successfully at /workspaces/notes"
echo "📝 Access your knowledge base by opening /workspaces/notes in VS Code"
echo "🚀 Use Ctrl+Shift+P → 'Foam: Show Graph' to visualize your notes"
