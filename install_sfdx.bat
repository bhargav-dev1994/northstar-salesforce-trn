@echo off
REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Node.js is not installed. Please install Node.js to proceed.
    exit /b 1
)

REM Install Salesforce CLI using npm
npm install --global sfdx-cli

REM Verify Salesforce CLI installation
sfdx --version
