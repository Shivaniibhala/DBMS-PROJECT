@echo off
echo ==================================
echo Scholarship Finder - Installation
echo ==================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo Node.js is not installed. Please install Node.js first.
    pause
    exit /b 1
)

echo Step 1: Installing Backend Dependencies...
cd backend
call npm install

echo.
echo Step 2: Installing Frontend Dependencies...
cd ..\frontend
call npm install

echo.
echo Step 3: Setting up database...
echo Please run the following command manually:
echo mysql -u root -p ^< backend\config\schema.sql
echo.

cd ..\backend
if not exist .env (
    copy .env.example .env
    echo.
    echo IMPORTANT: Please edit backend\.env with your database credentials!
    echo Required fields:
    echo   - DB_PASSWORD (MySQL root password)
    echo   - JWT_SECRET (any random string)
    echo.
)

echo.
echo ==================================
echo Installation Complete!
echo ==================================
echo.
echo Next steps:
echo 1. Edit backend\.env with your credentials
echo 2. Set up database: mysql -u root -p ^< backend\config\schema.sql
echo 3. Start backend: cd backend ^&^& npm start
echo 4. Start frontend: cd frontend ^&^& npm start
echo.
echo For detailed instructions, see README.md or QUICKSTART.md
pause

