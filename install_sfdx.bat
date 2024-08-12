@echo off
REM Download Salesforce CLI
powershell -Command "Invoke-WebRequest -Uri https://developer.salesforce.com/media/salesforce-cli/sfdx-cli.zip -OutFile sfdx-cli.zip"

REM Extract Salesforce CLI
powershell -Command "Expand-Archive -Path sfdx-cli.zip -DestinationPath sfdx"

REM Add Salesforce CLI to PATH
setx PATH "%PATH%;%CD%\sfdx\bin"

REM Verify installation
sfdx --version
