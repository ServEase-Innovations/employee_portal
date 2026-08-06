# 🎯 START HERE

## Welcome to ServEase Employee Portal! 👋

This is your **one-stop guide** to get up and running in minutes.

---

## 🚀 Quick Start (3 Steps)

### 1️⃣ Clone the Repository
```bash
git clone --recurse-submodules https://github.com/ServEase-Innovations/employee_portal.git
cd employee_portal
```

### 2️⃣ Run Setup
```bash
./setup.sh
```

### 3️⃣ Configure & Start
```bash
# Configure backend
cd NewPortal_BE
cp .env.example .env
nano .env  # Add your DATABASE_URL and JWT_SECRET

# Setup database
npx prisma generate
npx prisma migrate deploy
cd ..

# Start everything with ONE command!
npm start
```

**That's it!** 🎉

---

## 🎮 The Magic Command

After setup, you only need **ONE command** to start everything:

```bash
npm start
```

This single command:
- ✅ Starts the backend API (http://localhost:5000)
- ✅ Starts the frontend UI (http://localhost:3000)
- ✅ Shows colored logs for both services
- ✅ Stops both with a single Ctrl+C

### Alternative Start Methods

```bash
# Using the bash script
./start.sh

# Start individually
npm run dev:backend   # Backend only
npm run dev:frontend  # Frontend only
```

---

## 📂 What's Inside?

```
employee_portal/
├── NewPortal_BE/         Backend API (Express + TypeScript)
├── ServEase_portal/      Frontend App (React + Tailwind)
├── start.sh              🚀 Single command start script
└── setup.sh              📦 Setup script
```

---

## 🔗 Access Your Application

After running `npm start`:

| Service | URL | Description |
|---------|-----|-------------|
| **Frontend** | http://localhost:3000 | Main application |
| **Backend** | http://localhost:5000 | API endpoints |
| **API Docs** | http://localhost:5000/api-docs | Swagger documentation |

---

## 📚 Documentation

- **[README.md](./README.md)** - Complete documentation
- **[QUICK_START.md](./QUICK_START.md)** - Fast setup guide
- **[COMMANDS.md](./COMMANDS.md)** - All available commands
- **[.github/SETUP_OVERVIEW.md](.github/SETUP_OVERVIEW.md)** - Visual guide with diagrams

---

## 🆘 Having Issues?

### Port Already in Use?
```bash
# Kill the process
lsof -ti:5000 | xargs kill -9  # Backend
lsof -ti:3000 | xargs kill -9  # Frontend
```

### Database Connection Error?
```bash
# Check if PostgreSQL is running
pg_isready

# Or use Supabase (free cloud database)
# Get connection string from https://supabase.com
```

### Submodules Empty?
```bash
git submodule init
git submodule update
```

### Need Fresh Install?
```bash
rm -rf node_modules package-lock.json
rm -rf NewPortal_BE/node_modules NewPortal_BE/package-lock.json
rm -rf ServEase_portal/node_modules ServEase_portal/package-lock.json
npm run install:all
```

---

## 💡 Pro Tips

1. **Always use `npm start`** - It's the easiest way!
2. **Keep the terminal open** - You'll see logs from both services
3. **Check API docs first** - http://localhost:5000/api-docs
4. **Use Supabase** - Skip local PostgreSQL setup
5. **Read COMMANDS.md** - Learn all available commands

---

## 🎯 Common Tasks

### View Database
```bash
npm run prisma:studio
```

### Build for Production
```bash
npm run build
```

### Install All Dependencies
```bash
npm run install:all
```

### Run Migrations
```bash
npm run prisma:migrate
```

---

## 🎉 You're Ready!

Run `npm start` and start building amazing things!

**Need more help?** Check out the full [README.md](./README.md)

---

Made with ❤️ by ServEase Innovations
