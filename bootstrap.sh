#!/usr/bin/env bash
set -e

echo "Bootstrapping project..."

# Initialize uv project if needed
if [ ! -f pyproject.toml ]; then
  uv init
fi

if ! grep -q "\[tool.ruff\]" pyproject.toml; then
  cat << 'EOF' >> pyproject.toml

[tool.ruff]
line-length = 88
target-version = "py312"
EOF
fi


# Ensure dev tooling exists
uv add ruff --dev

# Sync environment
uv sync

echo "Ready to develop."

