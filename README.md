# Employee Portal - Monorepo

This is a monorepo containing all ServEase employee portal applications.

## Repository Structure

```
employee_portal/
├── ServEase_portal/     # Frontend application
├── NewPortal_BE/        # Backend API
└── README.md            # This file
```

## Projects

### ServEase_portal
Frontend application for the employee portal.

**Location:** `./ServEase_portal`

**Setup:**
```bash
cd ServEase_portal
npm install
npm run dev
```

### NewPortal_BE
Backend API server for the employee portal.

**Location:** `./NewPortal_BE`

**Setup:**
```bash
cd NewPortal_BE
npm install
npm run dev
```

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/ServEase-Innovations/employee_portal.git
   cd employee_portal
   ```

2. Install dependencies for each project:
   ```bash
   # Install frontend dependencies
   cd ServEase_portal
   npm install
   
   # Install backend dependencies
   cd ../NewPortal_BE
   npm install
   ```

3. Set up environment variables for each project (see respective README files)

4. Start the applications:
   ```bash
   # Terminal 1 - Start backend
   cd NewPortal_BE
   npm run dev
   
   # Terminal 2 - Start frontend
   cd ServEase_portal
   npm run dev
   ```

## Development

Each project maintains its own:
- Dependencies (package.json)
- Configuration files
- README with specific instructions
- Git history (as nested repositories)

## Contributing

Please refer to the individual project READMEs for contribution guidelines.

## License

See individual project LICENSE files.