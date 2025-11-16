#!/bin/bash

echo "=================================="
echo "Scholarship Finder - Installation"
echo "=================================="

# Check if MySQL is installed
if ! command -v mysql &> /dev/null
then
    echo "MySQL is not installed. Please install MySQL first."
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "Node.js is not installed. Please install Node.js first."
    exit 1
fi

echo ""
echo "Step 1: Installing Backend Dependencies..."
cd backend
npm install

echo ""
echo "Step 2: Installing Frontend Dependencies..."
cd ../frontend
npm install

echo ""
echo "Step 3: Setting up database..."
echo "Please provide your MySQL root password:"
mysql -u root -p < ../backend/config/schema.sql

echo ""
echo "Step 4: Environment Setup"
cd ../backend
if [ ! -f .env ]; then
    cp .env.example .env
    echo ""
    echo "IMPORTANT: Please edit backend/.env with your database credentials!"
    echo "Required fields:"
    echo "  - DB_PASSWORD (MySQL root password)"
    echo "  - JWT_SECRET (any random string)"
    echo ""
fi

echo ""
echo "=================================="
echo "Installation Complete!"
echo "=================================="
echo ""
echo "Next steps:"
echo "1. Edit backend/.env with your credentials"
echo "2. Start backend: cd backend && npm start"
echo "3. Start frontend: cd frontend && npm start"
echo ""
echo "For detailed instructions, see README.md or QUICKSTART.md"

