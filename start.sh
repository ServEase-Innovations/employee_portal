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

# Run database migrations
echo "🗄️  Running database migrations..."
cd NewPortal_BE
if npx prisma migrate deploy 2>/dev/null; then
    echo "✅ Database migrations applied successfully!"
else
    echo "⚠️  Failed to apply migrations. Database might not be accessible."
    echo "   Please check your DATABASE_URL in .env file."
    echo ""
    read -p "Do you want to continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        cd ..
        exit 1
    fi
fi
cd ..
echo ""

echo "✅ All dependencies ready!"
echo ""
echo "Starting applications..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📱 Frontend: http://localhost:3000"
echo "🔌 Backend:  http://localhost:5000"
echo "📖 API Docs: http://localhost:5000/api-docs"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Press Ctrl+C to stop all services"
echo ""

# Start both applications using npm script
npm run dev
