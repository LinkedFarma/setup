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

# Clone the private EnvironmentSetup repository as gruppy directory
echo "📦 Cloning EnvironmentSetup repository..."
if [ -d "gruppy" ]; then
    echo "⚠️  gruppy directory already exists."
    cd gruppy
    git pull origin master || true
else
    if ! git clone git@github.com:LinkedFarma/EnvironmentSetup.git gruppy; then
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
    cd gruppy
fi

echo ""
echo "⚙️  Running setup..."
make setup

echo ""
echo "✅ Setup completed successfully!"
