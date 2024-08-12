@echo off
setlocal

:: Define the URL for the latest Salesforce CLI
set "SFDX_URL=https://developer.salesforce.com/media/salesforce-cli/sfdx-cli-7.206.1-windows-x64.zip"
set "SFDX_ZIP=sfdx-cli.zip"
set "SFDX_DIR=sfdx"

:: Download Salesforce CLI
echo Downloading Salesforce CLI...
powershell -Command "Invoke-WebRequest -Uri %SFDX_URL% -OutFile %SFDX_ZIP%"

:: Unzip Salesforce CLI
echo Extracting Salesforce CLI...
powershell -Command "Expand-Archive -Path %SFDX_ZIP% -DestinationPath %SFDX_DIR%"

:: Add Salesforce CLI to PATH
set "PATH=%CD%\%SFDX_DIR%\bin;%PATH%"

:: Clean up
del %SFDX_ZIP%

:: Verify installation
echo Verifying Salesforce CLI installation...
sfdx --version

endlocal
