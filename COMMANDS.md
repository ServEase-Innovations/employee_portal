# 📋 Command Reference

Quick reference for all available commands in the ServEase Employee Portal monorepo.

## 🚀 Starting the Application

### Single Command Start (Recommended)

```bash
# Start both backend and frontend together
npm start

# OR using the bash script
./start.sh
```

**What it does:**
- ✅ Starts backend on http://localhost:5000
- ✅ Starts frontend on http://localhost:3000
- ✅ Shows colored output: `[BACKEND]` and `[FRONTEND]`
- ✅ Stops both with single Ctrl+C

### Individual Start

```bash
# Start backend only
npm run dev:backend

# Start frontend only
npm run dev:frontend
```

## 📦 Installation Commands

```bash
# Install all dependencies (root + submodules)
npm run install:all

# Install root dependencies only
npm install

# Install backend dependencies
cd NewPortal_BE && npm install

# Install frontend dependencies
cd ServEase_portal && npm install
```

## 🏗️ Build Commands

```bash
# Build both projects
npm run build

# Build backend only
npm run build:backend

# Build frontend only
npm run build:frontend
```

## 🗄️ Database Commands

```bash
# Generate Prisma client
npm run prisma:generate

# Run database migrations
npm run prisma:migrate

# Open Prisma Studio (database viewer)
npm run prisma:studio
```

**OR run from backend directly:**

```bash
cd NewPortal_BE

# Generate Prisma client
npx prisma generate

# Create and run a new migration
npx prisma migrate dev --name migration_name

# Deploy migrations (production)
npx prisma migrate deploy

# Reset database (⚠️ deletes all data)
npx prisma migrate reset

# Push schema changes without migration
npx prisma db push

# Open Prisma Studio
npx prisma studio
```

## 🔧 Setup Commands

```bash
# Automated setup (install all dependencies)
./setup.sh

# Manual setup steps
git submodule init
git submodule update
cd NewPortal_BE && npm install && cd ..
cd ServEase_portal && npm install && cd ..
```

## 🧪 Type Checking

```bash
# Check backend TypeScript types
cd NewPortal_BE && npm run typecheck
```

## 📁 Project Navigation

```bash
# Go to backend
cd NewPortal_BE

# Go to frontend
cd ServEase_portal

# Go to root
cd /path/to/employee_portal
```

## 🔄 Git Submodule Commands

```bash
# Initialize submodules
git submodule init

# Update submodules to latest commit
git submodule update

# Update submodules to latest from remote
git submodule update --remote

# Clone with submodules
git clone --recurse-submodules <repo-url>

# Update specific submodule
cd NewPortal_BE
git pull origin main
cd ..
git add NewPortal_BE
git commit -m "Update backend submodule"
```

## 🛠️ Development Workflow

### Start Development
```bash
# 1. Clone the repo
git clone --recurse-submodules https://github.com/ServEase-Innovations/employee_portal.git
cd employee_portal

# 2. Run setup
./setup.sh

# 3. Configure backend environment
cd NewPortal_BE
cp .env.example .env
nano .env  # Edit with your values

# 4. Setup database
npx prisma generate
npx prisma migrate deploy
cd ..

# 5. Start everything
npm start
```

### Make Changes
```bash
# 1. Create feature branch
git checkout -b feature/your-feature

# 2. Make changes in submodule
cd NewPortal_BE  # or ServEase_portal
# ... make your changes ...

# 3. Test locally
cd ..
npm start

# 4. Commit changes
cd NewPortal_BE  # or ServEase_portal
git add .
git commit -m "Your commit message"
git push origin feature/your-feature

# 5. Create pull request on GitHub
```

## 🐛 Troubleshooting Commands

### Check if services are running
```bash
# Check if backend port is in use
lsof -ti:5000

# Check if frontend port is in use
lsof -ti:3000

# Kill process on port
lsof -ti:5000 | xargs kill -9
```

### Check PostgreSQL
```bash
# Check if PostgreSQL is ready
pg_isready

# Check PostgreSQL version
psql --version

# Connect to database
psql -U username -d database_name
```

### Clear and Reinstall
```bash
# Clear all node_modules and reinstall
rm -rf node_modules package-lock.json
rm -rf NewPortal_BE/node_modules NewPortal_BE/package-lock.json
rm -rf ServEase_portal/node_modules ServEase_portal/package-lock.json
npm run install:all

# Clear npm cache
npm cache clean --force
```

### Check Node/npm versions
```bash
node --version   # Should be v18+
npm --version    # Should be v9+
git --version    # Should be v2+
```

## 📊 Useful Commands Summary

| Command | Description |
|---------|-------------|
| `npm start` | Start both backend and frontend |
| `./start.sh` | Alternative start script |
| `npm run install:all` | Install all dependencies |
| `npm run build` | Build both projects |
| `npm run prisma:studio` | Open database viewer |
| `./setup.sh` | Automated setup |
| `Ctrl+C` | Stop all running services |

## 🔗 Access URLs

After running `npm start`, access:

- **Frontend Application:** http://localhost:3000
- **Backend API:** http://localhost:5000
- **API Documentation:** http://localhost:5000/api-docs
- **Prisma Studio:** Run `npm run prisma:studio`

## 💡 Pro Tips

1. **Use `npm start`** for daily development - it's the fastest way
2. **Keep Prisma Studio open** in a browser tab for database inspection
3. **Check API docs** at `/api-docs` to understand available endpoints
4. **Use Git branches** for features - never commit directly to main
5. **Update submodules regularly** to get latest changes from team

## 🆘 Quick Help

```bash
# Forgot what commands are available?
npm run

# Check package.json scripts
cat package.json | grep "scripts" -A 20

# View this file
cat COMMANDS.md
```

---

**For detailed documentation, see [README.md](./README.md)**
