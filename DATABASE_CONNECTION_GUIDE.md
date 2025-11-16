# Database Connection Guide

This guide will help you connect your existing MySQL database to the Scholarship Finder application.

## Your Existing Database Schema

You already have the `scholarships` table in the `scholarship_db` database with these columns:

- `scholarship_id` (INT, AUTO_INCREMENT, PRIMARY KEY)
- `state` (VARCHAR(50))
- `scholarship_title` (VARCHAR(255))
- `qualification` (VARCHAR(50))
- `family_income` (INT)
- `scholarship_amount` (INT)
- `caste` (VARCHAR(50))
- `community` (VARCHAR(100))
- `gender` (VARCHAR(20))
- `outcome_of_the_scholarship` (VARCHAR(255))
- `tentative_deadline` (VARCHAR(50))

## Step-by-Step Connection Guide

### Step 1: Install Required Additional Tables

Your `scholarships` table already exists. Now you need to create the supporting tables:

1. Open MySQL command line or MySQL Workbench

2. Connect to your database:
```sql
USE scholarship_db;
```

3. Create the additional tables by running this command in PowerShell:

```powershell
mysql -u root -p scholarship_db < backend\config\schema.sql
```

Or manually run these SQL commands:

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

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_state ON scholarships(state);
CREATE INDEX IF NOT EXISTS idx_qualification ON scholarships(qualification);
CREATE INDEX IF NOT EXISTS idx_gender ON scholarships(gender);
CREATE INDEX IF NOT EXISTS idx_deadline ON scholarships(tentative_deadline);
```

### Step 2: Configure Environment Variables

1. Navigate to the backend folder:
```powershell
cd backend
```

2. Create a `.env` file:
```powershell
notepad .env
```

3. Add these configurations (replace with your actual MySQL password):

```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password_here
DB_NAME=scholarship_db

JWT_SECRET=any_random_string_here_for_jwt_security

EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password
```

4. Save the file

### Step 3: Install Backend Dependencies

Make sure Node.js is installed first (if not, see SETUP_GUIDE.md)

```powershell
npm install
```

### Step 4: Test Database Connection

```powershell
npm start
```

You should see:
```
Connected to MySQL database
Server running on port 5000
API available at http://localhost:5000/api
```

If you see errors, check:
- MySQL is running
- Password in `.env` is correct
- Database `scholarship_db` exists

### Step 5: Verify Your Data

Check if your scholarships are accessible:

1. Start the backend (if not already running)

2. Test the API:
```powershell
curl http://localhost:5000/api/scholarships
```

Or visit in browser: http://localhost:5000/api/scholarships

You should see your scholarship data!

### Step 6: Start Frontend

Open a NEW PowerShell window:

```powershell
cd "D:\dbms final project\frontend"
npm install
npm start
```

The app will open at http://localhost:3000

### Step 7: Test the Application

1. Go to http://localhost:3000
2. Click "Sign Up" to create an account
3. Log in with your account
4. Browse your scholarships
5. Add some to your wishlist

## Troubleshooting

### Database Connection Error

**Error:** `Access denied for user 'root'@'localhost'`

**Solution:**
- Check password in `.env` file
- Verify MySQL is running: `services.msc` → Check MySQL service

### Table Already Exists Error

**Error:** `Table 'users' already exists`

**Solution:**
- This is okay! It means tables already exist
- You can skip Step 1 or drop tables first if needed

### Empty Scholarship List

**Solution:**
- Verify your data exists: 
  ```sql
  SELECT COUNT(*) FROM scholarships;
  ```
- Data types should match your schema (INT for amounts, not string)

## Data Format

Since your `family_income` and `scholarship_amount` are INT types, make sure your data uses integers:

```sql
INSERT INTO scholarships VALUES 
(NULL, 'Tamil Nadu', 'Engineering Scholarship', 'BTech', 200000, 50000, 'General', 'All', 'All', 'New Scholarship', '2024-12-31');
```

## Column Mapping

Your schema → Application mapping:

| Your Column | Application Use |
|-------------|----------------|
| `scholarship_id` | Primary key (auto) |
| `state` | Filterable field |
| `scholarship_title` | Display name |
| `qualification` | Filterable field |
| `family_income` | Filterable field (INT) |
| `scholarship_amount` | Display (INT) |
| `caste` | Filterable field |
| `community` | Filterable field |
| `gender` | Filterable field |
| `outcome_of_the_scholarship` | Display field |
| `tentative_deadline` | Email alerts use this |

## Next Steps

1. ✅ Database connected
2. ✅ Backend running
3. ✅ Frontend running
4. ✅ Test the application
5. ✅ Customize filters if needed

## Summary

Your existing database structure is fully compatible with the application. The only differences are:

- Column name: `outcome_of_the_scholarship` (instead of `outcome`)
- Data types: INT for income and amount (instead of VARCHAR)

All necessary changes have been made to the application to work with your schema!

