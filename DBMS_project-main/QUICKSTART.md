# Quick Start Guide

Get the Scholarship Finder application up and running in 5 minutes!

## Prerequisites

- Node.js (v14 or higher)
- MySQL (v5.7 or higher)
- npm or yarn

## Step-by-Step Setup

### Step 1: Database Setup

1. Open MySQL terminal or any MySQL client
2. Run the schema file:

```bash
mysql -u root -p < backend/config/schema.sql
```

Or manually:
```sql
mysql -u root -p
CREATE DATABASE scholarship_db;
USE scholarship_db;
source backend/config/schema.sql;
```

### Step 2: Backend Setup

```bash
cd backend
npm install
```

Create a `.env` file:
```bash
# Copy the example
cp .env.example .env

# Edit .env with your credentials:
# DB_PASSWORD=your_mysql_password
# JWT_SECRET=any_random_string_here
```

Start the backend:
```bash
npm start
```

Backend should now be running at `http://localhost:5000`

### Step 3: Load Sample Data (Optional)

```bash
# From the backend directory
node utils/loadData.js
```

### Step 4: Frontend Setup

Open a **new terminal window**:

```bash
cd frontend
npm install
npm start
```

Frontend should now be running at `http://localhost:3000`

### Step 5: Test the Application

1. Open `http://localhost:3000` in your browser
2. Click "Sign Up" to create an account
3. Browse scholarships on the home page
4. Use filters to search
5. Login and add scholarships to your wishlist
6. Visit the wishlist page

## Quick Commands

### Backend
```bash
cd backend
npm start          # Start server
npm run dev        # Start with auto-reload
node utils/loadData.js  # Load sample data
```

### Frontend
```bash
cd frontend
npm start          # Start development server
npm run build      # Build for production
```

## API Testing

You can test API endpoints using:
- Postman
- cURL
- Any REST client

Example:
```bash
# Signup
curl -X POST http://localhost:5000/api/auth/signup \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@test.com","password":"password123"}'

# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"john@test.com","password":"password123"}'

# Get scholarships (replace TOKEN with actual token)
curl -H "Authorization: Bearer TOKEN" http://localhost:5000/api/scholarships
```

## Email Notifications Setup (Optional)

To enable email alerts:

1. For Gmail:
   - Go to Account Settings → Security
   - Enable 2-Factor Authentication
   - Generate an App Password
   - Use this password in `.env`

2. Update `backend/.env`:
```
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password_here
```

## Troubleshooting

### Backend won't start
- Check MySQL is running: `mysql -u root -p`
- Verify `.env` credentials
- Check if port 5000 is available

### Frontend won't start
- Check if port 3000 is available
- Delete `node_modules` and run `npm install` again
- Check console for errors

### Database connection error
- Verify MySQL is running
- Check credentials in `backend/.env`
- Ensure database exists: `mysql -u root -p -e "SHOW DATABASES;"`

### Can't find scholarships
- Load sample data: `node backend/utils/loadData.js`
- Check database: `mysql -u root -p -e "USE scholarship_db; SELECT * FROM scholarships;"`

## Next Steps

- Load your actual dataset using `backend/utils/loadCSV.js`
- Customize the UI in `frontend/src`
- Modify cron schedule in `backend/server.js` (currently 9 AM daily)
- Add more filters or features

## Support

If you encounter issues:
1. Check the terminal for error messages
2. Verify all prerequisites are installed
3. Ensure all environment variables are set
4. Check the main README.md for detailed documentation

Happy coding! 🎓

