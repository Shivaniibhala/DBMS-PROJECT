# Your Database Setup - Quick Start

## 🎯 What We Changed

Your existing database schema is now fully integrated! Here's what was updated:

### Files Updated to Match Your Schema:
1. ✅ `backend/config/schema.sql` - Updated to work with your existing table
2. ✅ `backend/models/Scholarship.js` - Column name changed to `outcome_of_the_scholarship`
3. ✅ `backend/services/emailService.js` - Updated deadline checking logic
4. ✅ `frontend/src/components/ScholarshipList.js` - Updated to display `outcome_of_the_scholarship`
5. ✅ `backend/utils/loadData.js` - Updated sample data loader
6. ✅ `backend/utils/loadCSV.js` - Updated CSV loader

### Your Schema Compatibility:
- ✅ `scholarship_id` - Works (Primary key)
- ✅ `state` - Works (Filter support)
- ✅ `scholarship_title` - Works
- ✅ `qualification` - Works (Filter support)
- ✅ `family_income` (INT) - Works (Filter support)
- ✅ `scholarship_amount` (INT) - Works
- ✅ `caste` - Works (Filter support)
- ✅ `community` - Works (Filter support)
- ✅ `gender` - Works (Filter support)
- ✅ `outcome_of_the_scholarship` - Works (updated from `outcome`)
- ✅ `tentative_deadline` - Works (Email alerts)

---

## 🚀 Quick Setup Steps

### Step 1: Create Additional Tables (10 minutes)

Open MySQL Command Line or MySQL Workbench:

```sql
USE scholarship_db;
```

Then create the additional tables needed for the app:

```sql
-- Create users table
CREATE TABLE IF NOT EXISTS users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create wishlist table
CREATE TABLE IF NOT EXISTS wishlist (
  wishlist_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  scholarship_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (scholarship_id) REFERENCES scholarships(scholarship_id) ON DELETE CASCADE,
  UNIQUE KEY unique_wishlist (user_id, scholarship_id)
);

-- Create email_alerts table
CREATE TABLE IF NOT EXISTS email_alerts (
  alert_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  scholarship_id INT NOT NULL,
  email_sent BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (scholarship_id) REFERENCES scholarships(scholarship_id) ON DELETE CASCADE
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_state ON scholarships(state);
CREATE INDEX IF NOT EXISTS idx_qualification ON scholarships(qualification);
CREATE INDEX IF NOT EXISTS idx_gender ON scholarships(gender);
CREATE INDEX IF NOT EXISTS idx_deadline ON scholarships(tentative_deadline);
```

Or use the provided SQL file:

```powershell
mysql -u root -p scholarship_db < backend\config\schema.sql
```

### Step 2: Configure Backend (5 minutes)

1. Navigate to backend folder:
```powershell
cd backend
```

2. Create `.env` file:
```powershell
notepad .env
```

3. Copy this content (replace `YOUR_PASSWORD` with your MySQL root password):

```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=YOUR_PASSWORD
DB_NAME=scholarship_db

JWT_SECRET=my_super_secret_jwt_key_12345

EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password
```

4. Save and close

### Step 3: Install Dependencies (5 minutes)

**First, install Node.js if not already done:**
- Download from: https://nodejs.org/
- Install it
- Restart PowerShell

**Then install packages:**

```powershell
# Make sure you're in backend folder
cd "D:\dbms final project\backend"

# Install backend dependencies
npm install
```

### Step 4: Start Backend (1 minute)

```powershell
npm start
```

You should see:
```
Connected to MySQL database
Server running on port 5000
API available at http://localhost:5000/api
```

**If you see errors**, check:
- MySQL is running
- Password in `.env` is correct
- Database `scholarship_db` exists

### Step 5: Test Your Data (1 minute)

Open a web browser and visit:
```
http://localhost:5000/api/scholarships
```

You should see your scholarship data in JSON format!

### Step 6: Start Frontend (5 minutes)

**Open a NEW PowerShell window** (keep backend running):

```powershell
cd "D:\dbms final project\frontend"
npm install
npm start
```

Frontend will open at: http://localhost:3000

### Step 7: Test the Application

1. Visit http://localhost:3000
2. Click "Sign Up" to create an account
3. Enter details and create account
4. You'll be logged in automatically
5. Browse your scholarships
6. Try the filters
7. Click "Add to Wishlist" on any scholarship
8. Visit "My Wishlist" to see saved items

---

## ✅ Verification Checklist

- [ ] Node.js installed (`node -v` works)
- [ ] MySQL installed and running (`mysql --version` works)
- [ ] `scholarship_db` database exists
- [ ] `scholarships` table has data
- [ ] Created `users`, `wishlist`, `email_alerts` tables
- [ ] Created `backend/.env` file with correct password
- [ ] Ran `npm install` in backend folder
- [ ] Backend starts without errors
- [ ] Can access http://localhost:5000/api/scholarships
- [ ] Ran `npm install` in frontend folder
- [ ] Frontend starts without errors
- [ ] Can access http://localhost:3000
- [ ] Can sign up and log in
- [ ] Can see scholarships from database
- [ ] Can add to wishlist

---

## 🎯 Current Status

✅ **Database**: Already exists with `scholarships` table  
✅ **Schema**: Fully compatible with your structure  
✅ **Code**: Updated to work with your column names  
✅ **Filters**: Work with your data types (INT for amounts)  
✅ **Ready**: Just install Node.js and run!

---

## 📋 Quick Command Reference

```powershell
# Check Node.js
node -v

# Check MySQL
mysql --version

# Create additional tables
cd backend
mysql -u root -p scholarship_db < config\schema.sql

# Install backend
cd backend
npm install

# Start backend
npm start

# Install frontend (new terminal)
cd frontend
npm install

# Start frontend
npm start

# Test API
curl http://localhost:5000/api/scholarships
```

---

## 🆘 Need Help?

**Issue**: `npm` command not found
**Solution**: Install Node.js from https://nodejs.org/ and restart terminal

**Issue**: Database connection error
**Solution**: Check `.env` file has correct MySQL password

**Issue**: Empty scholarship list
**Solution**: Verify data exists: `SELECT COUNT(*) FROM scholarships;`

**Issue**: Port already in use
**Solution**: Change `PORT` in `.env` to another number (e.g., 5001)

---

## 🎉 You're All Set!

Your existing database is now fully integrated with the application. Just:
1. Install Node.js
2. Create the additional tables
3. Configure `.env`
4. Run `npm install` and `npm start` in both folders

Everything else is already configured for your schema! 🚀

