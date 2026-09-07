# 🔐 ServEase Employee Portal - Test Credentials

## Quick Start Login Credentials

Use these credentials to test different role permissions in the system.

---

## 📋 All Test Accounts

| Role          | Username   | Password      | Department        | Access Level        |
|---------------|------------|---------------|-------------------|---------------------|
| **SuperAdmin** | `admin`    | `admin123`    | Administration    | Full System Access  |
| **Manager**    | `manager`  | `manager123`  | Engineering       | Team Management     |
| **HR**         | `hr`       | `hr123`       | Human Resources   | HR Functions        |
| **Developer**  | `employee` | `employee123` | Engineering       | Standard Employee   |

---

## 🎯 Role-Specific Access

### 🔴 SuperAdmin (`admin`)
- Full system administration
- Manage all users and settings
- Access to all modules
- System configuration

### 🟡 Manager (`manager`)
- Team management
- Approve leave requests
- View team attendance
- Manage daily task submissions
- Payroll approval (if assigned)

### 🟢 HR (`hr`)
- Employee management
- Leave management
- Payroll processing
- Attendance oversight
- Generate reports

### 🔵 Developer (`employee`)
- Mark attendance
- Submit daily tasks
- Request leaves
- View own payslips
- Standard employee features

---

## 🚀 How to Use

1. **Start the backend server:**
   ```bash
   cd NewPortal_BE
   npm run dev
   ```

2. **Start the frontend:**
   ```bash
   cd ServEase_portal
   npm start
   ```

3. **Login with any account above**
   - Navigate to the login page
   - Enter username and password
   - Test role-specific features

---

## 🛠️ Creating Users

### Create Admin User
```bash
cd NewPortal_BE
npm run create-admin
```

### Create All Test Users
```bash
cd NewPortal_BE
npm run create-test-users
```

Both scripts are **safe to run multiple times** - they check if users exist before creating.

---

## ⚠️ Security Warnings

1. **These are TEST credentials only**
2. **NEVER use these in production**
3. **Change passwords after first login**
4. **Create strong passwords for production use**

---

## 📝 User Details

### Admin Account
```yaml
Name: System Administrator
Username: admin
Password: admin123
Email: admin@servease.com
Role: SuperAdmin
Department: Administration
Salary: ₹100,000/month
```

### Manager Account
```yaml
Name: Mike Team Lead
Username: manager
Password: manager123
Email: manager@servease.com
Role: Manager
Department: Engineering
Salary: ₹80,000/month
```

### HR Account
```yaml
Name: Sarah HR Manager
Username: hr
Password: hr123
Email: hr@servease.com
Role: HR
Department: Human Resources
Salary: ₹60,000/month
```

### Employee Account
```yaml
Name: John Developer
Username: employee
Password: employee123
Email: employee@servease.com
Role: Developer
Department: Engineering
Salary: ₹50,000/month
```

---

## 🧪 Testing Scenarios

### Scenario 1: Employee Workflow
1. Login as `employee`
2. Mark attendance
3. Submit daily task
4. Request leave
5. View payslip

### Scenario 2: Manager Workflow
1. Login as `manager`
2. View team attendance
3. Approve/reject leave requests
4. Review daily tasks
5. Generate team reports

### Scenario 3: HR Workflow
1. Login as `hr`
2. Manage all employees
3. Process payroll
4. Generate payslips
5. Manage leave policies
6. View system reports

### Scenario 4: Admin Workflow
1. Login as `admin`
2. Create new users
3. Manage system settings
4. View all data
5. Configure system

---

## 📞 Support

For issues or questions:
- Check `DEFAULT_LOGIN.md` in NewPortal_BE
- Review API documentation at: http://localhost:4000/api-docs
- Contact development team

---

**Last Updated:** January 6, 2026  
**Version:** 1.0.0
