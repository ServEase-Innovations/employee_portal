# Attendance 8-Hour Present/Absent Rule

## Overview
Implemented automatic Present/Absent status determination based on total hours worked per day. A day is marked as **Present** only if the employee works >= 8 hours, otherwise marked as **Absent**.

## Changes Made

### Backend Changes

#### 1. `NewPortal_BE/src/controllers/attendance.controller.ts`
**Line ~259-275**: Added 8-hour threshold logic in `updateAttendance` function
- When employee clocks out (final clock-out of the day), the system calculates `totalHoursComputed`
- If `totalHoursComputed >= 8.0 hours`: Status automatically set to `Working` (Present)
- If `totalHoursComputed < 8.0 hours`: Status automatically set to `Absent`
- Logs the decision for audit trail

```typescript
// NEW: Auto-set status based on 8-hour threshold
if (calculation.totalHours !== undefined) {
  if (calculation.totalHours >= 8.0) {
    updateData.shiftStatus = AttendanceStatus.Working; // Present for the day
    console.log(`✅ Day marked as Present: ${calculation.totalHours.toFixed(2)}h >= 8.0h`);
  } else {
    updateData.shiftStatus = AttendanceStatus.Absent; // Absent for the day
    console.log(`❌ Day marked as Absent: ${calculation.totalHours.toFixed(2)}h < 8.0h`);
  }
}
```

#### 2. `NewPortal_BE/src/services/attendance.service.ts`
**Line ~222-247**: Updated `autoClosePreviousDayAttendance` function
- When auto-closing previous day's unclosed attendance records, applies the same 8-hour rule
- Ensures consistency across manual clock-outs and auto-closed records
- Sets appropriate status based on total hours worked

```typescript
// NEW: Determine status based on 8-hour threshold
let finalStatus = record.shiftStatus;
if (totalHours >= 8.0) {
  finalStatus = AttendanceStatus.Working; // Present
  console.log(`✅ Auto-close: Day marked as Present (${totalHours.toFixed(2)}h >= 8.0h)`);
} else {
  finalStatus = AttendanceStatus.Absent; // Absent
  console.log(`❌ Auto-close: Day marked as Absent (${totalHours.toFixed(2)}h < 8.0h)`);
}
```

### Frontend Changes

#### 3. `ServEase_portal/src/components/Dashboard/shared/StatusBadge.tsx`
**Complete rewrite**: Enhanced to display Present/Absent status based on backend data
- Added new props: `shiftStatus` and `totalHoursToday`
- Logic to show:
  - **🟢 Working**: When currently clocked in
  - **✅ Present**: When clocked out with >= 8 hours worked
  - **❌ Absent**: When clocked out with < 8 hours worked
  - **⚠️ Incomplete**: Edge case for working status but clocked out with <8 hours
  - **🔵 On Leave**: When on leave
  - **⚪ Not Working**: Default state

```typescript
// If clocked out, show Present/Absent based on hours worked
if (isClockedOut && totalHoursToday !== undefined) {
  if (shiftStatus === 'Absent') {
    return { label: '❌ Absent', class: 'bg-rose-500/20 text-rose-400 border border-rose-500/30' };
  } else if (shiftStatus === 'Working' && totalHoursToday >= 8.0) {
    return { label: '✅ Present', class: 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30' };
  }
}
```

#### 4. `ServEase_portal/src/components/Dashboard/EmployeeDashboard/DashboardTab.tsx`
**Line ~267**: Updated StatusBadge component call to pass new props
```typescript
<StatusBadge 
  isClockedIn={isClockedIn} 
  isClockedOut={isClockedOut} 
  workStatus={workStatus}
  shiftStatus={todayAttendance?.shiftStatus}
  totalHoursToday={totalHoursToday}
/>
```

#### 5. `ServEase_portal/src/components/Dashboard/ManagerDashboard/overview/OverviewTab.tsx`
**Line ~155**: Updated StatusBadge component call to pass new props
```typescript
<StatusBadge 
  isClockedIn={isClockedIn} 
  isClockedOut={isClockedOut} 
  workStatus={workStatus}
  shiftStatus={todayAttendance?.shiftStatus}
  totalHoursToday={totalHoursToday}
/>
```

### 6. `ServEase_portal/src/components/Dashboard/ManagerDashboard/overview/AttendanceCalendar.tsx`
**Line ~29-42**: Updated `getDateColor` function to mark weekends as holidays
- Checks if date is Saturday (6) or Sunday (0) using `getDay()`
- Weekends always display in purple color regardless of attendance data
- Weekend dates show `bg-purple-500/20 text-purple-400` styling

```typescript
// Check if this date is a weekend (Saturday=6, Sunday=0)
const dateObj = new Date(currentYear, currentMonth, date);
const dayOfWeek = dateObj.getDay();
const isWeekend = dayOfWeek === 0 || dayOfWeek === 6;

// Weekends are always holidays (purple)
if (isWeekend) {
  return { bg: 'bg-purple-500/20', text: 'text-purple-400' };
}
```

### 7. `ServEase_portal/src/components/Dashboard/EmployeeDashboard/DashboardTab.tsx`
**Line ~421-447**: Updated calendar rendering to mark weekends as holidays
- Calculates day of week for each date in the calendar
- Weekends (Sat/Sun) are rendered with purple background
- Weekdays follow normal attendance status colors

## Business Logic

### Attendance Status Enum
- **Working**: Employee is present and working (>= 8 hours completed on weekdays, OR any hours on weekends, OR currently working)
- **OnLeave**: Employee is on approved leave
- **Absent**: Employee worked < 8 hours for the day (weekdays only)

### Weekend Policy
- **Weekends (Saturday & Sunday) are holidays** - No attendance tracking required
- If an employee works on a weekend, **any hours worked = Present** (no 8-hour requirement)
- The attendance calendar displays weekends in purple to indicate holidays
- Payroll system does not deduct salary for weekends (they are not counted as working days)

### Calculation Flow
1. Employee clocks in → Status remains `Working`
2. Employee can clock in/out multiple times during the day (multiple sessions)
3. `totalHoursComputed` accumulates all session hours
4. On **final clock-out of the day**:
   - **If weekend (Sat/Sun)**: Any hours worked → Status = `Working` (Present)
   - **If weekday**:
     - If total >= 8.0h → Status = `Working` (Present)
     - If total < 8.0h → Status = `Absent`
5. Unclosed records from previous days are auto-closed with the same logic

### UI Display Logic
- While working: Badge shows **"🟢 Working"**
- After final clock-out:
  - If >= 8 hours: Badge shows **"✅ Present"**
  - If < 8 hours: Badge shows **"❌ Absent"**
- The badge color changes to match the status (green for present, red for absent)

## Impact on Other Systems

### Payroll/Payslip Calculation
- `NewPortal_BE/src/services/payslip.service.ts` already uses `shiftStatus === 'Absent'` to calculate unpaid leave deductions
- With this change, the payroll system will now correctly deduct salary for days with < 8 hours worked
- No additional changes needed to payroll system - it automatically benefits from accurate Present/Absent determination

### Reports & Analytics
- Any attendance reports that rely on `shiftStatus` will now show accurate Present/Absent counts
- Managers can see which employees consistently work full 8-hour days

## Testing Checklist

### Backend Tests
- [ ] **Weekdays**: Clock in and clock out with >= 8 hours → Status should be `Working`
- [ ] **Weekdays**: Clock in and clock out with < 8 hours → Status should be `Absent`
- [ ] **Weekends**: Clock in and clock out with any hours → Status should be `Working` (no 8-hour requirement)
- [ ] Multiple sessions in a day totaling >= 8 hours (weekday) → Status should be `Working`
- [ ] Multiple sessions in a day totaling < 8 hours (weekday) → Status should be `Absent`
- [ ] Previous weekday record auto-closed with >= 8 hours → Status should be `Working`
- [ ] Previous weekday record auto-closed with < 8 hours → Status should be `Absent`
- [ ] Previous weekend record auto-closed with any hours → Status should be `Working`
- [ ] Leave status should remain `OnLeave` (not affected by 8-hour rule)

### Frontend Tests
- [ ] StatusBadge shows "✅ Present" when clocked out with >= 8 hours (weekday)
- [ ] StatusBadge shows "❌ Absent" when clocked out with < 8 hours (weekday)
- [ ] StatusBadge shows "✅ Present" when clocked out with any hours (weekend)
- [ ] StatusBadge shows "🟢 Working" when currently clocked in
- [ ] **Attendance calendar shows weekends (Sat/Sun) in purple color**
- [ ] Attendance calendar legend shows "Holiday" indicator
- [ ] StatusBadge color changes appropriately (green/red/blue/purple)

### Integration Tests
- [ ] Verify payslip calculates unpaid leave correctly for < 8 hour days
- [ ] Verify attendance calendar shows correct Present/Absent colors
- [ ] Verify manager dashboard shows accurate team attendance status

## Configuration

### 8-Hour Threshold
The threshold is currently hardcoded as `8.0 hours`. To change it:

**Backend**:
- `NewPortal_BE/src/controllers/attendance.controller.ts` line ~270: `if (calculation.totalHours >= 8.0)`
- `NewPortal_BE/src/services/attendance.service.ts` line ~236: `if (totalHours >= 8.0)`

**Frontend**:
- `ServEase_portal/src/components/Dashboard/shared/StatusBadge.tsx` line ~26: `if (shiftStatus === 'Working' && totalHoursToday >= 8.0)`

**Future Enhancement**: Consider moving this to a configuration file or environment variable for easier management.

## Security Considerations
- Backend calculates `totalHoursComputed` from actual clock-in/out timestamps - client cannot manipulate
- Status is set by backend based on calculated hours - client cannot override
- All calculations use server timestamps, not client-provided values
- Audit trail: Console logs track status changes with justification

## Notes
- **Weekends (Saturday & Sunday) are automatically marked as holidays** - shown in purple on calendars
- **Weekend work doesn't require 8 hours** - any hours worked on weekends = Present
- The 8-hour rule **only applies to weekdays** (Monday-Friday)
- The rule only applies when an employee **clocks out for the final time** that day
- If an employee resumes work after clocking out, the status is not finalized until they clock out again
- Leave status (`OnLeave`) is manually set and not affected by the 8-hour rule
- The rule applies uniformly across all employees and roles
- Weekends are not counted in "Present days" calculations for payroll purposes
