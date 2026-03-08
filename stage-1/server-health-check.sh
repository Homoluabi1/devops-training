#!/bin/bash

# Server Health Check Script
# Author: Samuel Olukunle
# Purpose: Verify server tools and folder structure

echo "===== SERVER HEALTH CHECK ====="
echo ""

read -p "Enter your name: " NAME
echo "Hello $NAME, running health check..."
echo ""

# Check tools
echo "--- Checking Tools ---"
TOOLS=("git" "docker" "curl" "nano" "wget")
for tool in "${TOOLS[@]}"; do
    if command -v $tool &> /dev/null; then
        echo "✅ $tool is installed"
    else
        echo "❌ $tool is NOT installed"
    fi
done
echo ""

# Disk and memory
echo "--- Disk Usage ---"
df -h
echo ""
echo "--- Memory Usage ---"
free -h
echo ""

# Folder check
echo "--- Checking DevOpsTraining Folder ---"
if [ -d ~/DevOpsTraining ]; then
    echo "✅ DevOpsTraining folder exists"
else
    echo "❌ DevOpsTraining folder missing"
    mkdir ~/DevOpsTraining
    echo "📁 Created DevOpsTraining folder"
fi

echo ""
echo "===== HEALTH CHECK COMPLETE ====="
