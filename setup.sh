#!/bin/bash

# Employee Portal Monorepo Setup Script
# This script initializes all submodules and installs dependencies

set -e  # Exit on error

echo "🚀 Setting up Employee Portal Monorepo..."
echo ""

# Initialize and update submodules
echo "📦 Initializing Git submodules..."
git submodule init
git submodule update --recursive

# Install backend dependencies
echo ""
echo "📦 Installing backend dependencies..."
cd NewPortal_BE
if [ -f "package.json" ]; then
    npm install
    echo "✅ Backend dependencies installed"
else
    echo "⚠️  No package.json found in NewPortal_BE"
fi
cd ..

# Install frontend dependencies
echo ""
echo "📦 Installing frontend dependencies..."
cd ServEase_portal
if [ -f "package.json" ]; then
    npm install
    echo "✅ Frontend dependencies installed"
else
    echo "⚠️  No package.json found in ServEase_portal"
fi
cd ..

echo ""
echo "✅ Monorepo setup complete!"
echo ""
echo "Next steps:"
echo "1. Configure environment variables for each project"
echo "2. Start the backend: cd NewPortal_BE && npm run dev"
echo "3. Start the frontend: cd ServEase_portal && npm run dev"
echo ""
