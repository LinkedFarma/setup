#!/bin/bash

set -e

echo "🚀 Gruppy Environment Setup"
echo "============================"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

# Check if make is installed
if ! command -v make &> /dev/null; then
    echo "❌ Make is not installed. Please install make first."
    exit 1
fi

# Create gruppy directory
echo "📁 Creating gruppy directory..."
if [ -d "gruppy" ]; then
    echo "⚠️  gruppy directory already exists."
else
    mkdir gruppy
fi

cd gruppy

# Clone the private EnvironmentSetup repository
echo "📦 Cloning EnvironmentSetup repository..."
if [ -d "EnvironmentSetup" ]; then
    echo "⚠️  EnvironmentSetup directory already exists. Skipping clone."
    cd EnvironmentSetup
    git pull origin master || true
else
    if ! git clone git@github.com:LinkedFarma/EnvironmentSetup.git; then
        echo ""
        echo "❌ Failed to clone EnvironmentSetup repository."
        echo ""
        echo "You need to configure SSH credentials to access the private repository."
        echo "Please follow these steps:"
        echo "  1. Generate an SSH key: ssh-keygen -t ed25519 -C \"your_email@example.com\""
        echo "  2. Add the SSH key to your GitHub account: https://github.com/settings/ssh/new"
        echo "  3. Test your connection: ssh -T git@github.com"
        echo ""
        exit 1
    fi
    cd EnvironmentSetup
fi

echo ""
echo "⚙️  Running setup..."
make setup

echo ""
echo "✅ Setup completed successfully!"
