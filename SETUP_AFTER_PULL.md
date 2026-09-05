# Setup After Git Pull - Chat/Messaging Features

## 🎯 Quick Setup Guide

After pulling the latest changes with chat/messaging features, follow these steps:

---

## 📋 Prerequisites

Make sure you have:
- Node.js v20+ installed
- PostgreSQL database accessible
- `.env` file configured in `NewPortal_BE/`

---

## 🚀 Quick Start (Automated)

### Option 1: Use the start script (recommended)
```bash
./start.sh
```

This will:
1. ✅ Install all dependencies
2. ✅ Run database migrations
3. ✅ Start both backend and frontend

---

## 🔧 Manual Setup

### Option 2: Step-by-step manual installation

#### 1. Install Backend Dependencies
```bash
cd NewPortal_BE
npm install
```

**New packages installed:**
- `socket.io` - WebSocket server for real-time messaging
- `@types/socket.io` - TypeScript definitions

#### 2. Install Frontend Dependencies
```bash
cd ServEase_portal
npm install
```

**New packages installed:**
- `socket.io-client` - WebSocket client for real-time messaging

#### 3. Run Database Migrations
```bash
cd NewPortal_BE
npx prisma migrate deploy
npx prisma generate
```

**New migrations:**
- `20260827115006_init` - Adds messaging tables (conversation, message, conversationParticipant)

#### 4. Start the Applications
```bash
# From root directory
npm run dev

# OR separately:
# Backend
cd NewPortal_BE && npm run dev

# Frontend (in another terminal)
cd ServEase_portal && npm start
```

---

## 🆕 New Features Added

### Real-Time Chat/Messaging System

**Backend:**
- ✅ Socket.io server integration
- ✅ Message controller and service
- ✅ Message API routes with validation
- ✅ Database schema for conversations and messages
- ✅ Real-time message delivery

**Frontend:**
- ✅ ChatWindow component with modern UI
- ✅ Socket.io client integration
- ✅ useChat hook for chat functionality
- ✅ Chat service layer
- ✅ Message notifications in header
- ✅ Real-time updates

---

## 🔍 Verification

### Check if Socket.io is working:

1. **Backend running:** http://localhost:4000
   - Should see: "Socket.io server initialized"

2. **Frontend running:** http://localhost:3000
   - Should see chat icon in header
   - WebSocket should connect automatically

3. **Check browser console:**
   ```
   Socket connected: <socket-id>
   ```

---

## ⚠️ Troubleshooting

### Error: "Cannot find module 'socket.io'"
**Solution:**
```bash
cd NewPortal_BE
npm install socket.io @types/socket.io
```

### Error: "Cannot find module 'socket.io-client'"
**Solution:**
```bash
cd ServEase_portal
npm install socket.io-client
```

### Error: "Property 'conversation' does not exist on type 'PrismaClient'"
**Solution:**
```bash
cd NewPortal_BE
npx prisma migrate deploy
npx prisma generate
```

### Database Connection Error
**Solution:**
- Check `NewPortal_BE/.env` file
- Verify `DATABASE_URL` is correct
- Ensure database is accessible

---

## 📦 Package Versions

**Backend (NewPortal_BE):**
- socket.io: ^4.x
- @types/socket.io: ^3.x

**Frontend (ServEase_portal):**
- socket.io-client: ^4.x

---

## 📝 Database Schema Changes

New tables added:
- `Conversation` - Stores conversation metadata
- `Message` - Stores individual messages
- `ConversationParticipant` - Links users to conversations

---

## 🎊 You're All Set!

Once setup is complete:
1. Navigate to http://localhost:3000
2. Log in to the portal
3. Click the chat icon in the header
4. Start messaging in real-time! 💬

---

## 📞 Need Help?

If you encounter any issues:
1. Check the troubleshooting section above
2. Verify all dependencies are installed
3. Ensure database migrations ran successfully
4. Check browser console for errors

---

**Last Updated:** After merging chat/messaging features (commit: 75a5018 UI, 4522e49 BE)
