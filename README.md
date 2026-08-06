# 🚀 ServEase Employee Portal - Monorepo

A complete employee management system with a React frontend and Express/TypeScript backend. This monorepo contains both applications managed as Git submodules.

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Detailed Setup Guide](#detailed-setup-guide)
- [Project Structure](#project-structure)
- [Running the Application](#running-the-application)
- [Features](#features)
- [Troubleshooting](#troubleshooting)
- [Development](#development)

## ✅ Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v18 or higher) - [Download](https://nodejs.org/)
- **npm** (v9 or higher) - Comes with Node.js
- **Git** - [Download](https://git-scm.com/)
- **PostgreSQL** (v14 or higher) - [Download](https://www.postgresql.org/download/)
  - Or use a cloud database service like [Supabase](https://supabase.com/) (recommended for quick setup)

### Verify Installation

```bash
node --version    # Should be v18.x or higher
npm --version     # Should be v9.x or higher
git --version     # Should be v2.x or higher
```

## ⚡ Quick Start

Use this automated setup script for the fastest way to get started:

```bash
# Clone the repository with all submodules
git clone --recurse-submodules https://github.com/ServEase-Innovations/employee_portal.git
cd employee_portal

# Run the automated setup script
chmod +x setup.sh
./setup.sh
```

Then follow the [Running the Application](#running-the-application) section below.

## 📖 Detailed Setup Guide

### Step 1: Clone the Repository

```bash
# Clone with submodules (recommended)
git clone --recurse-submodules https://github.com/ServEase-Innovations/employee_portal.git
cd employee_portal

# OR if you already cloned without submodules:
git clone https://github.com/ServEase-Innovations/employee_portal.git
cd employee_portal
git submodule init
git submodule update
```

### Step 2: Set Up the Backend (NewPortal_BE)

#### 2.1 Install Dependencies

```bash
cd NewPortal_BE
npm install
```

#### 2.2 Configure Environment Variables

```bash
# Copy the example environment file
cp .env.example .env

# Edit the .env file with your actual values
nano .env  # or use your preferred editor
```

**Required Environment Variables:**

```env
# Database connection string
# Format: postgresql://USER:PASSWORD@HOST:PORT/DATABASE
DATABASE_URL="postgresql://username:password@localhost:5432/employee_portal"

# JWT Secret for authentication (use a strong random string)
JWT_SECRET="your-super-secret-jwt-key-change-this"

# Node environment
NODE_ENV="development"

# Server Port (backend will run on this port)
PORT=5000
```

#### 2.3 Set Up the Database

```bash
# Generate Prisma client
npx prisma generate

# Run database migrations
npx prisma migrate deploy

# (Optional) Open Prisma Studio to view your database
npx prisma studio
```

### Step 3: Set Up the Frontend (ServEase_portal)

#### 3.1 Install Dependencies

```bash
cd ../ServEase_portal
npm install
```

#### 3.2 Configure Environment Variables

The frontend comes with `.env.development` pre-configured, but you can customize it:

```bash
# Check/edit the environment file
nano .env.development  # or use your preferred editor
```

**Default Frontend Configuration:**

```env
# API Configuration (should match your backend PORT)
REACT_APP_API_URL=http://localhost:5000/

# Environment
REACT_APP_ENV=development

# API Timeout
REACT_APP_API_TIMEOUT=10000
```

⚠️ **Important:** If you changed the backend `PORT` in step 2.2, update `REACT_APP_API_URL` to match.

## 📁 Project Structure

```
employee_portal/                    # Main monorepo
├── NewPortal_BE/                   # Backend API (Git submodule)
│   ├── src/
│   │   ├── controllers/           # Route controllers
│   │   ├── services/              # Business logic
│   │   ├── routes/                # API routes
│   │   ├── middleware/            # Auth & upload middleware
│   │   └── app.ts                 # Express app entry point
│   ├── prisma/
│   │   ├── schema.prisma          # Database schema
│   │   └── migrations/            # Database migrations
│   ├── package.json
│   └── .env                       # Environment variables (create from .env.example)
│
├── ServEase_portal/               # Frontend React App (Git submodule)
│   ├── src/
│   │   ├── components/            # React components
│   │   ├── pages/                 # Page components
│   │   ├── services/              # API services
│   │   └── App.tsx                # Main app component
│   ├── public/
│   ├── package.json
│   └── .env.development           # Frontend environment variables
│
├── setup.sh                       # Automated setup script
└── README.md                      # This file
```

## 🏃 Running the Application

### Option 1: Single Command (Recommended) ⚡

Start both backend and frontend with **one command**:

```bash
cd employee_portal
npm start
```

**OR using the start script:**
```bash
cd employee_portal
./start.sh
```

This will automatically:
- Check and install dependencies if needed
- Start the backend on http://localhost:5000
- Start the frontend on http://localhost:3000
- Show colored output for both services
- Stop both services with a single Ctrl+C

You should see:
```
[BACKEND]  Server running on http://localhost:5000
[FRONTEND] Compiled successfully!
```

### Option 2: Run Individual Components

**Backend Only:**
```bash
cd NewPortal_BE
npm run dev           # Development with hot reload
```

**Frontend Only:**
```bash
cd ServEase_portal
npm start             # Development server
npm run build         # Production build
```

### Access the Application

- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:5000
- **API Documentation (Swagger):** http://localhost:5000/api-docs

## ✨ Features

### Backend (NewPortal_BE)
- 🔐 **Authentication & Authorization** - JWT-based auth with role management
- 👥 **Employee Management** - Full CRUD operations for employees
- 👔 **Team Management** - Organize employees into teams
- 📅 **Attendance Tracking** - Clock in/out and attendance reports
- 📝 **Daily Task Submissions** - Submit daily reports with file attachments
- 💰 **Payroll Management** - Generate payslips with attendance integration
- 📊 **API Documentation** - Auto-generated Swagger documentation
- 🗄️ **PostgreSQL Database** - Robust data storage with Prisma ORM

### Frontend (ServEase_portal)
- 🎨 **Modern UI** - Built with React and Tailwind CSS
- 📱 **Responsive Design** - Works on desktop, tablet, and mobile
- 🔄 **Real-time Updates** - React Query for efficient data fetching
- 📊 **Dashboard** - Overview of key metrics and statistics
- 👤 **User Profiles** - Manage employee information
- 📈 **Reports & Analytics** - Charts and data visualization
- 🔔 **Notifications** - Toast notifications for user actions

## 🛠️ Troubleshooting

### Common Issues

#### Database Connection Failed

```
Error: Can't reach database server at `localhost:5432`
```

**Solution:**
1. Ensure PostgreSQL is running: `pg_isready`
2. Check your `DATABASE_URL` in `.env`
3. Verify database credentials and that the database exists
4. Try creating the database: `createdb employee_portal`

#### Port Already in Use

```
Error: listen EADDRINUSE: address already in use :::5000
```

**Solution:**
1. Change the `PORT` in `NewPortal_BE/.env`
2. Update `REACT_APP_API_URL` in `ServEase_portal/.env.development` to match
3. Or kill the process using the port:
   ```bash
   # macOS/Linux
   lsof -ti:5000 | xargs kill -9
   ```

#### Frontend Can't Connect to Backend

```
Network Error / CORS Error
```

**Solution:**
1. Ensure backend is running on the correct port
2. Check `REACT_APP_API_URL` in frontend `.env.development`
3. Verify CORS is properly configured in backend (it should be by default)

#### Prisma Migration Failed

```
Error: P3005: The database schema is not empty
```

**Solution:**
```bash
cd NewPortal_BE
npx prisma migrate reset  # Caution: This will delete all data
npx prisma migrate deploy
```

#### Submodules Not Initialized

```
fatal: not a git repository (or any of the parent directories)
```

**Solution:**
```bash
cd employee_portal
git submodule init
git submodule update
```

### Reset Everything

If you want to start fresh:

```bash
# Stop all running servers (Ctrl+C in terminals)

# Backend reset
cd NewPortal_BE
rm -rf node_modules package-lock.json
npm install
npx prisma migrate reset
npx prisma generate

# Frontend reset
cd ../ServEase_portal
rm -rf node_modules package-lock.json
npm install
```

## 👨‍💻 Development

### Database Management

```bash
cd NewPortal_BE

# View database in browser
npx prisma studio

# Create a new migration
npx prisma migrate dev --name your_migration_name

# Reset database (deletes all data)
npx prisma migrate reset

# Push schema changes without migration
npx prisma db push
```

### API Testing

- **Swagger UI:** http://localhost:5000/api-docs
- **Example API Call:**
  ```bash
  curl http://localhost:5000/api/employees
  ```

### Building for Production

**Backend:**
```bash
cd NewPortal_BE
npm run build
npm start
```

**Frontend:**
```bash
cd ServEase_portal
npm run build
# Deploy the 'build' folder to your hosting service
```

### Updating Submodules

```bash
# Update all submodules to latest
git submodule update --remote

# Update specific submodule
cd NewPortal_BE
git pull origin main
cd ..
git add NewPortal_BE
git commit -m "Update backend submodule"
```

## 📚 Additional Resources

- **Backend Documentation:** See `NewPortal_BE/README.md`
- **API Documentation:** http://localhost:5000/api-docs (when server is running)
- **Frontend Documentation:** See `ServEase_portal/README.md`

## 🤝 Contributing

1. Create a feature branch: `git checkout -b feature/your-feature-name`
2. Make your changes in the appropriate submodule
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Submit a pull request

## 📝 License

See individual project LICENSE files in `NewPortal_BE` and `ServEase_portal`.

## 🆘 Need Help?

If you encounter any issues not covered in the troubleshooting section:

1. Check the individual project READMEs (`NewPortal_BE/README.md`, `ServEase_portal/README.md`)
2. Review the API documentation at http://localhost:5000/api-docs
3. Check the browser console and terminal logs for error messages
4. Create an issue in the respective repository

---

**Happy Coding! 🎉**