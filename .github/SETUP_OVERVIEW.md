# 🎯 Setup Overview

Visual guide for setting up the ServEase Employee Portal monorepo.

## 📦 What You're Getting

```
┌─────────────────────────────────────────────────────┐
│         ServEase Employee Portal Monorepo           │
│                                                     │
│  ┌──────────────┐         ┌──────────────┐        │
│  │   Frontend   │◄───────►│   Backend    │        │
│  │ ServEase_    │  HTTP   │ NewPortal_   │        │
│  │   portal     │ :5000   │     BE       │        │
│  │              │         │              │        │
│  │  React +     │         │  Express +   │        │
│  │  Tailwind    │         │  TypeScript  │        │
│  │              │         │              │        │
│  │  Port: 3000  │         │  Port: 5000  │        │
│  └──────────────┘         └──────┬───────┘        │
│                                   │                 │
│                                   ▼                 │
│                          ┌──────────────┐          │
│                          │  PostgreSQL  │          │
│                          │   Database   │          │
│                          └──────────────┘          │
└─────────────────────────────────────────────────────┘
```

## 🚦 Setup Steps

### ✅ Step 1: Clone Repository
```bash
git clone --recurse-submodules https://github.com/ServEase-Innovations/employee_portal.git
cd employee_portal
```

**What happens:**
- Downloads main repo
- Automatically downloads submodules (frontend + backend)

### ✅ Step 2: Install Dependencies
```bash
./setup.sh
```
**OR manually:**
```bash
cd NewPortal_BE && npm install && cd ..
cd ServEase_portal && npm install && cd ..
```

**What happens:**
- Installs all Node.js packages for both projects
- Sets up development dependencies

### ✅ Step 3: Configure Backend
```bash
cd NewPortal_BE
cp .env.example .env
nano .env  # Edit with your database credentials
```

**Required Configuration:**
```env
DATABASE_URL="postgresql://user:pass@host:5432/dbname"
JWT_SECRET="your-random-secret-key"
PORT=5000
```

### ✅ Step 4: Initialize Database
```bash
npx prisma generate    # Generate Prisma client
npx prisma migrate deploy  # Run migrations
```

**What happens:**
- Creates database tables
- Sets up schema
- Prepares Prisma ORM

### ✅ Step 5: Run Applications

**Terminal 1 - Backend:**
```bash
cd NewPortal_BE
npm run dev
```
**Expected output:**
```
✓ Server running on http://localhost:5000
✓ Swagger docs available at http://localhost:5000/api-docs
```

**Terminal 2 - Frontend:**
```bash
cd ServEase_portal
npm start
```
**Expected output:**
```
✓ Compiled successfully!
✓ Local: http://localhost:3000
```

## 🌐 Access Points

After successful setup, you can access:

| Service | URL | Description |
|---------|-----|-------------|
| **Frontend** | http://localhost:3000 | Main application UI |
| **Backend API** | http://localhost:5000 | REST API endpoints |
| **API Docs** | http://localhost:5000/api-docs | Swagger documentation |
| **Prisma Studio** | Run `npx prisma studio` | Database viewer |

## 🎨 Technology Stack

### Frontend (ServEase_portal)
- ⚛️ **React 18** - UI framework
- 🎨 **Tailwind CSS** - Styling
- 📊 **Chart.js & Recharts** - Data visualization
- 🔄 **React Query** - Data fetching
- 🛣️ **React Router** - Navigation
- 📝 **React Hook Form** - Form management
- 🔥 **React Hot Toast** - Notifications

### Backend (NewPortal_BE)
- 🟢 **Node.js + Express** - Server framework
- 📘 **TypeScript** - Type safety
- 🗄️ **Prisma ORM** - Database toolkit
- 🐘 **PostgreSQL** - Database
- 🔐 **JWT** - Authentication
- 📝 **Swagger** - API documentation
- 📁 **Multer** - File uploads
- 📄 **PDFKit** - PDF generation

## 🔐 Default Features

### Authentication & Authorization
- JWT-based authentication
- Role-based access control (SuperAdmin, HR, Manager, Employee)
- Secure password hashing with bcrypt

### Core Modules
1. **Employee Management** - CRUD operations, profiles
2. **Team Management** - Team organization and hierarchy
3. **Attendance System** - Clock in/out, attendance reports
4. **Daily Tasks** - Daily task submissions with file attachments
5. **Payroll System** - Automated payslip generation

## 📊 Data Flow

```
┌─────────────┐
│   Browser   │
│ (localhost: │
│    3000)    │
└──────┬──────┘
       │ HTTP Requests
       │ (Axios)
       ▼
┌─────────────┐
│  Express    │
│   Server    │
│ (localhost: │
│    5000)    │
└──────┬──────┘
       │ Prisma ORM
       │ (SQL queries)
       ▼
┌─────────────┐
│ PostgreSQL  │
│  Database   │
└─────────────┘
```

## 🔍 Verification Checklist

After setup, verify everything works:

- [ ] Backend server starts without errors
- [ ] Frontend compiles successfully
- [ ] Can access http://localhost:3000
- [ ] Can access http://localhost:5000/api-docs
- [ ] Database connection is successful
- [ ] Prisma migrations are applied
- [ ] Environment variables are configured

## 🆘 Common Issues & Solutions

### Issue: "Port 5000 already in use"
**Solution:** macOS AirPlay uses port 5000
```bash
# Option 1: Disable AirPlay Receiver in System Settings
# Option 2: Change backend port
# In NewPortal_BE/.env: PORT=5001
# In ServEase_portal/.env.development: REACT_APP_API_URL=http://localhost:5001/
```

### Issue: "Database connection failed"
**Solution:**
```bash
# Check PostgreSQL is running
pg_isready

# Or use cloud database (Supabase recommended)
# Get connection string from Supabase dashboard
```

### Issue: "Submodules are empty"
**Solution:**
```bash
git submodule init
git submodule update --recursive
```

### Issue: "npm install fails"
**Solution:**
```bash
# Clear cache and retry
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

## 📚 Next Steps

1. **Read the full documentation**: [README.md](../README.md)
2. **Explore the API**: http://localhost:5000/api-docs
3. **Check individual project docs**:
   - Backend: `NewPortal_BE/README.md`
   - Frontend: `ServEase_portal/README.md`
4. **Start developing**: Make your first changes!

## 🤝 Development Workflow

```bash
# Create a feature branch
git checkout -b feature/your-feature

# Make changes in the appropriate submodule
cd NewPortal_BE  # or ServEase_portal

# Test your changes
npm run dev

# Commit changes
git add .
git commit -m "Your commit message"

# Push and create PR
git push origin feature/your-feature
```

---

**Ready to build something amazing! 🚀**
