# Scholarship Finder Web Application

A full-stack web application to help students find and manage scholarships. Built with React.js, Node.js, Express.js, and MySQL.

## Features

- ✅ User Authentication (Signup/Login with JWT)
- ✅ Scholarship Listing with Advanced Filters
- ✅ Wishlist Management
- ✅ Automatic Deadline Alerts (Email Notifications)
- ✅ Clean and Modern UI

## Tech Stack

- **Frontend**: React.js
- **Backend**: Node.js with Express.js
- **Database**: MySQL
- **Authentication**: JWT
- **Email**: Nodemailer
- **Scheduling**: node-cron

## Project Structure

```
scholarship-finder/
├── backend/
│   ├── config/
│   │   ├── database.js
│   │   └── schema.sql
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── scholarshipController.js
│   │   └── wishlistController.js
│   ├── middleware/
│   │   └── auth.js
│   ├── models/
│   │   ├── User.js
│   │   ├── Scholarship.js
│   │   └── Wishlist.js
│   ├── routes/
│   │   ├── authRoutes.js
│   │   ├── scholarshipRoutes.js
│   │   └── wishlistRoutes.js
│   ├── services/
│   │   └── emailService.js
│   ├── utils/
│   │   ├── loadData.js
│   │   └── loadCSV.js
│   ├── server.js
│   ├── package.json
│   └── .env
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── context/
│   │   ├── App.js
│   │   └── index.js
│   ├── package.json
│   └── README.md
└── README.md
```

## Setup Instructions

### 1. Database Setup

1. Install MySQL if not already installed
2. Create the database using the provided schema:

```bash
cd backend
mysql -u root -p < config/schema.sql
```

### 2. Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file (copy from `.env.example`):
```bash
cp .env.example .env
```

4. Update the `.env` file with your credentials:
```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=scholarship_db
JWT_SECRET=your_secret_key
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password
```

5. Start the backend server:
```bash
npm start
# Or for development:
npm run dev
```

The backend will run on `http://localhost:5000`

### 3. Frontend Setup

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```

The frontend will run on `http://localhost:3000`

### 4. Load Sample Data

To load sample data into the database:

```bash
cd backend
node utils/loadData.js
```

Or load from a CSV file:
```bash
node utils/loadCSV.js path/to/your/file.csv
```

## API Endpoints

### Authentication
- `POST /api/auth/signup` - Sign up a new user
- `POST /api/auth/login` - Login user

### Scholarships
- `GET /api/scholarships` - Get all scholarships (with optional query filters)
- `GET /api/scholarships/:id` - Get a specific scholarship

### Wishlist (Protected - Requires JWT)
- `POST /api/wishlist` - Add scholarship to wishlist
- `GET /api/wishlist` - Get user's wishlist
- `DELETE /api/wishlist/:scholarshipId` - Remove from wishlist

## Features in Detail

### 1. User Authentication
- Secure password hashing using bcryptjs
- JWT-based authentication
- Session management

### 2. Scholarship Filtering
Filter scholarships by:
- State
- Qualification
- Gender
- Caste
- Community
- Family Income

### 3. Wishlist Management
- Save favorite scholarships
- View personal wishlist
- Remove items from wishlist

### 4. Email Alerts
- Automatic deadline reminders (runs daily at 9 AM)
- Email notifications via Nodemailer
- Configurable alert frequency

## Usage

1. **Sign Up**: Create a new account
2. **Browse Scholarships**: Use the filters to find relevant scholarships
3. **Add to Wishlist**: Click "Add to Wishlist" on any scholarship (requires login)
4. **View Wishlist**: Access your saved scholarships
5. **Receive Alerts**: Get email notifications about upcoming deadlines

## Email Configuration

To enable email notifications:

1. For Gmail:
   - Enable 2-factor authentication
   - Generate an App Password
   - Use this password in the `EMAIL_PASS` environment variable

2. Update `.env`:
```
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password
```

## Development

- Backend: Uses nodemon for auto-reload during development
- Frontend: Uses Create React App with hot reloading
- Database: MySQL with connection pooling

## Production Deployment

1. Build the frontend:
```bash
cd frontend
npm run build
```

2. Update environment variables for production
3. Use a process manager like PM2 for the backend
4. Set up reverse proxy (nginx) for production hosting

## Troubleshooting

- **Database connection error**: Check MySQL is running and credentials in `.env`
- **Email not sending**: Verify email credentials and app password
- **CORS errors**: Ensure backend allows frontend origin
- **Port conflicts**: Change PORT in `.env` if port 5000 is taken

## License

MIT

## Contributing

Feel free to submit issues and enhancement requests!

