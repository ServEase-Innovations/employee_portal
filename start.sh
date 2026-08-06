#!/bin/bash

# ServEase Employee Portal - Start Script
# Starts both backend and frontend with a single command

set -e  # Exit on error

echo "🚀 Starting ServEase Employee Portal..."
echo ""

# Check if concurrently is installed
if ! npm list concurrently > /dev/null 2>&1; then
    echo "📦 Installing dependencies..."
    npm install
    echo ""
fi

# Check if submodule dependencies are installed
if [ ! -d "NewPortal_BE/node_modules" ]; then
    echo "📦 Installing backend dependencies..."
    cd NewPortal_BE
    npm install
    cd ..
    echo ""
fi

if [ ! -d "ServEase_portal/node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    cd ServEase_portal
    npm install
    cd ..
    echo ""
fi

# Check if .env exists in backend
if [ ! -f "NewPortal_BE/.env" ]; then
    echo "⚠️  WARNING: Backend .env file not found!"
    echo "   Please copy .env.example to .env and configure it:"
    echo "   cd NewPortal_BE && cp .env.example .env"
    echo ""
    read -p "Do you want to continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo "✅ All dependencies ready!"
echo ""

# Read backend port from .env file, default to 5001 if not found
BACKEND_PORT=5001
if [ -f "NewPortal_BE/.env" ]; then
    # Extract PORT value from .env file
    BACKEND_PORT=$(grep -E "^PORT=" NewPortal_BE/.env | cut -d '=' -f2 | tr -d ' "' || echo "5001")
fi

echo "Starting applications..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📱 Frontend: http://localhost:3000"
echo "🔌 Backend:  http://localhost:${BACKEND_PORT}"
echo "📖 API Docs: http://localhost:${BACKEND_PORT}/api-docs"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Press Ctrl+C to stop all services"
echo ""

# Start both applications using npm script
npm run dev
