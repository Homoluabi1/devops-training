#!/bin/bash

# Check if a tool is installed

echo "Checking if git is installed..."

if command -v git &> /dev/null; then
    echo "✅ Git is installed: $(git --version)"
else
    echo "❌ Git is NOT installed"
fi

echo ""
echo "Checking if docker is installed..."

if command -v docker &> /dev/null; then
    echo "✅ Docker is installed: $(docker --version)"
else
    echo "❌ Docker is NOT installed"
fi
