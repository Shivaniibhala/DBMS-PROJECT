# Setup Guide for Windows

## Issue: Node.js is not installed

If you're getting errors like:
- `npm : The term 'npm' is not recognized`
- `node : The term 'node' is not recognized`

You need to install Node.js first.

---

## Step 1: Install Node.js

### Option A: Download and Install (Recommended)

1. **Download Node.js:**
   - Go to: https://nodejs.org/
   - Click "Download" (downloads the LTS version)
   - File name will be like: `node-v20.x.x-x64.msi`

2. **Run the Installer:**
   - Double-click the downloaded file
   - Click "Next" through the installation
   - **IMPORTANT:** Check the box "Add to PATH" if it's not already checked
   - Click "Install"

3. **Verify Installation:**
   - Close and reopen PowerShell or Command Prompt
   - Run these commands:
   ```powershell
   node -v
   npm -v
   ```
   - You should see version numbers

### Option B: Using Chocolatey (If you have it)

```powershell
choco install nodejs
```

### Option C: Using winget (Windows 10/11)

```powershell
winget install OpenJS.NodeJS.LTS
```

---

## Step 2: Install MySQL (If not installed)

### Check if MySQL is installed:
```powershell
mysql --version
```

### If not installed:

1. **Download MySQL:**
   - Go to: https://dev.mysql.com/downloads/installer/
   - Download "MySQL Installer for Windows"
   - Run the installer

2. **Install MySQL Server:**
   - Select "MySQL Server"
   - Complete the installation
   - Remember your root password!

---

## Step 3: Set Up the Project

### 1. Open PowerShell or Command Prompt

Navigate to the project folder:
```powershell
cd "D:\dbms final project"
```

### 2. Create the Database

```powershell
# Run MySQL and create database
mysql -u root -p

# In MySQL, run:
source backend/config/schema.sql

# Or exit MySQL and run:
mysql -u root -p < backend\config\schema.sql
```

### 3. Install Backend Dependencies

```powershell
cd backend
npm install
```

### 4. Configure Environment Variables

Create a `.env` file in the `backend` folder:

```powershell
# In backend folder
notepad .env
```

Add this content (replace with your actual credentials):
```
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=scholarship_db

JWT_SECRET=your_random_secret_key_here

EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password
```

Save and close the file.

### 5. Start Backend Server

```powershell
# Still in backend folder
npm start
```

Backend should be running on http://localhost:5000

### 6. Install Frontend Dependencies (New Terminal)

Open a NEW PowerShell/Command Prompt window:

```powershell
cd "D:\dbms final project\frontend"
npm install
npm start
```

Frontend should be running on http://localhost:3000

---

## Step 4: Load Sample Data (Optional)

In a new terminal, run:

```powershell
cd "D:\dbms final project\backend"
node utils/loadData.js
```

---

## Step 5: Access the Application

1. Open browser
2. Go to: http://localhost:3000
3. You should see the Scholarship Finder homepage!

---

## Troubleshooting

### Node.js not found after installation

**Solution:** Restart your terminal/PowerShell

### MySQL not found

**Solution:** 
- Check if MySQL is in PATH
- Or use full path: `C:\Program Files\MySQL\MySQL Server X.X\bin\mysql.exe`

### Port already in use

**Solution:**
- Change PORT in `backend/.env` to something else (e.g., 5001)
- Or stop the program using the port

### Connection refused

**Solution:**
- Check if MySQL is running
- Verify database credentials in `.env`
- Make sure database exists: `mysql -u root -p -e "SHOW DATABASES;"`

---

## Quick Commands Reference

```powershell
# Check Node.js version
node -v

# Check npm version
npm -v

# Check MySQL version
mysql --version

# Navigate to backend
cd backend

# Install dependencies
npm install

# Start backend
npm start

# Navigate to frontend
cd ..\frontend

# Install dependencies
cd frontend
npm install

# Start frontend
npm start
```

---

## Need Help?

1. Restart your terminal after installing Node.js
2. Verify installations with `node -v` and `npm -v`
3. Check `.env` file has correct database password
4. Ensure MySQL is running
5. Make sure ports 3000 and 5000 are available

---

## Next Steps After Setup

1. ✅ Node.js installed
2. ✅ MySQL installed
3. ✅ Database created
4. ✅ Backend running (http://localhost:5000)
5. ✅ Frontend running (http://localhost:3000)
6. ✅ Load sample data
7. ✅ Test the application

Happy coding! 🚀

