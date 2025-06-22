@echo off
echo ====================================
echo R Introduction App - Windows Launcher
echo ====================================
echo.

REM Check if R is installed
where R >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: R is not installed or not in PATH
    echo.
    echo Please install R from: https://cran.r-project.org/
    echo And optionally RStudio from: https://posit.co/downloads/
    echo.
    echo After installation, make sure R is in your system PATH
    echo or use RStudio to open and run the app.R file
    echo.
    pause
    exit /b 1
)

echo R installation found!
echo.

REM Change to the app directory
cd /d "%~dp0"

echo Installing required packages...
R --vanilla --slave -e "source('setup.R')"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Package installation failed
    echo Please check the error messages above
    echo.
    pause
    exit /b 1
)

echo.
echo Starting the R Shiny application...
echo The app will open in your default web browser
echo Press Ctrl+C in this window to stop the app
echo.

R --vanilla -e "shiny::runApp('app.R', launch.browser=TRUE)"

echo.
echo App has been stopped
pause
