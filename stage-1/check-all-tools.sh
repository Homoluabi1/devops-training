#!/bin/bash

# Check multiple tools using a loop

echo "========================================="
echo "   DevOps Tools Installation Checker"
echo "========================================="
echo ""

# List of tools to check
TOOLS=("git" "docker" "curl" "nano")

for tool in "${TOOLS[@]}"; do
    if command -v $tool &> /dev/null; then
        echo "✅ $tool is installed"
    else
        echo "❌ $tool is NOT installed"
    fi
done

echo ""
echo "Check complete!"
