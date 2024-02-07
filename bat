@echo off
setlocal

:: Replace these with your actual API endpoint and body parameters
set API_URL=http://example.com/api/token
set PARAM1=value1
set PARAM2=value2
set PARAM3=value3
set PARAM4=value4

:: Construct the curl command
set CURL_COMMAND=curl -X POST "%API_URL%" -d "param1=%PARAM1%" -d "param2=%PARAM2%" -d "param3=%PARAM3%" -d "param4=%PARAM4%"

:: Execute curl command and parse the JSON response in PowerShell
for /f "delims=" %%i in ('%CURL_COMMAND% ^| powershell -Command "$input | ConvertFrom-Json | Select -ExpandProperty access_token"') do set ACCESS_TOKEN=%%i

:: Echo the access token
echo Access Token: %ACCESS_TOKEN%

endlocal



example

@echo off
setlocal

:: Replace this with your actual API endpoint
set API_URL=http://example.com/api/token

:: Set your parameters here
set USER=123
set PASSWORD=456

:: Construct the curl command with your parameters
set CURL_COMMAND=curl -X POST "%API_URL%" -d "user=%USER%" -d "password=%PASSWORD%"

:: Execute curl command and parse the JSON response in PowerShell
for /f "delims=" %%i in ('%CURL_COMMAND% ^| powershell -Command "$input | ConvertFrom-Json | Select -ExpandProperty access_token"') do set ACCESS_TOKEN=%%i

:: Echo the access token
echo Access Token: %ACCESS_TOKEN%

endlocal

