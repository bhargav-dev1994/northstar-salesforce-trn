@echo off
REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Node.js is not installed. Please install Node.js to proceed.
    exit /b 1
)

REM Clean npm cache
npm cache clean --force

REM Remove any existing sfdx-cli installations
if exist "%ProgramFiles%\npm\prefix\node_modules\sfdx-cli" (
    rmdir /s /q "%ProgramFiles%\npm\prefix\node_modules\sfdx-cli"
)
if exist "%ProgramFiles%\npm\prefix\node_modules\.sfdx-cli-*" (
    rmdir /s /q "%ProgramFiles%\npm\prefix\node_modules\.sfdx-cli-*"
)

REM Install Salesforce CLI using npm
npm install --global sfdx-cli

REM Verify Salesforce CLI installation
sfdx --version
