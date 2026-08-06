# ⚡ Quick Start Guide

Get the ServEase Employee Portal running in 5 minutes!

## 🎯 One-Command Setup

```bash
git clone --recurse-submodules https://github.com/ServEase-Innovations/employee_portal.git
cd employee_portal
./setup.sh
```

## 🗄️ Database Setup

**Option 1: Use Supabase (Easiest - No local PostgreSQL needed)**
1. Go to https://supabase.com and create a free account
2. Create a new project
3. Copy the connection string from Settings → Database
4. Use it in your `.env` file

**Option 2: Local PostgreSQL**
```bash
# Install PostgreSQL, then:
createdb employee_portal
```

## 🔧 Configuration

### Backend (.env)
```bash
cd NewPortal_BE
cp .env.example .env
```

Edit `.env`:
```env
DATABASE_URL="postgresql://username:password@localhost:5432/employee_portal"
JWT_SECRET="your-secret-key-here"
PORT=5000
```

### Initialize Database
```bash
npx prisma generate
npx prisma migrate deploy
```

## 🚀 Run the Application

**Single Command - Start Everything:**
```bash
cd employee_portal
npm start
```

**OR:**
```bash
cd employee_portal
./start.sh
```

This starts both backend and frontend together! 🎉

### Manual Start (Alternative)

**Terminal 1 - Backend:**
```bash
cd NewPortal_BE
npm run dev
```
✅ Backend: http://localhost:5000
📖 API Docs: http://localhost:5000/api-docs

**Terminal 2 - Frontend:**
```bash
cd ServEase_portal
npm start
```
✅ Frontend: http://localhost:3000

## 🎉 You're Done!

Open http://localhost:3000 in your browser!

## 🆘 Quick Troubleshooting

**Port 5000 already in use?**
```bash
# Change PORT in NewPortal_BE/.env to 5001 (or any available port)
# Update REACT_APP_API_URL in ServEase_portal/.env.development to match
```

**Database connection error?**
```bash
# Check PostgreSQL is running
pg_isready

# Or use Supabase connection string instead
```

**Submodules empty?**
```bash
git submodule init
git submodule update
```

---

For detailed documentation, see [README.md](./README.md)
