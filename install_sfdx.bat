@echo off
setlocal

REM Check if sfdx is installed
where sfdx >nul 2>&1
if %errorlevel% neq 0 (
    echo Salesforce CLI is not installed. Installing...

    REM Download and install Salesforce CLI
    powershell -Command "Invoke-WebRequest -Uri 'https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-windows-x64.zip' -OutFile 'sfdx-cli.zip'"
    powershell -Command "Expand-Archive -Path 'sfdx-cli.zip' -DestinationPath 'sfdx'"

    REM Add sfdx to PATH
    set "PATH=%CD%\sfdx\bin;%PATH%"

    REM Clean up
    del sfdx-cli.zip

    REM Verify installation
    sfdx --version
    if %errorlevel% neq 0 (
        echo Installation failed.
        exit /b 1
    )
) else (
    echo Salesforce CLI is already installed.
)

endlocal
