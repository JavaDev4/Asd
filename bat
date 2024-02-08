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


----------
@echo off
setlocal

:: First API call settings
set API_URL1=http://example.com/api/token
set USER=123
set PASSWORD=456

:: Second API call settings (replace with your actual values)
set API_URL2=http://example.com/second/api
set KEY1=value1
set KEY2=value2

:: First API call to get the access token
set CURL_COMMAND1=curl -X POST "%API_URL1%" -d "user=%USER%" -d "password=%PASSWORD%"
for /f "delims=" %%i in ('%CURL_COMMAND1% ^| powershell -Command "$input | ConvertFrom-Json | Select -ExpandProperty access_token"') do set ACCESS_TOKEN=%%i

:: Second API call using the access token
set CURL_COMMAND2=curl -X POST "%API_URL2%" -H "Authorization: Bearer %ACCESS_TOKEN%" -H "Content-Type: application/json" -d "{\"key1\":\"%KEY1%\", \"key2\":\"%KEY2%\"}"
for /f "delims=" %%j in ('%CURL_COMMAND2% ^| powershell -Command "$input | ConvertFrom-Json | Select -ExpandProperty tokens"') do set TOKENS=%%j

:: Echo the tokens from the second API call
echo Tokens: %TOKENS%

endlocal
----
example


@echo off
setlocal

:: First API call to get the access token (using your previous example)
set API_URL1=http://example.com/api/token
set USER=123
set PASSWORD=456

:: First API call to get the access token
set CURL_COMMAND1=curl -X POST "%API_URL1%" -d "user=%USER%" -d "password=%PASSWORD%"
for /f "delims=" %%i in ('%CURL_COMMAND1% ^| powershell -Command "$input | ConvertFrom-Json | Select -ExpandProperty access_token"') do set ACCESS_TOKEN=%%i

:: Second API call settings (replace with your actual values)
set API_URL2=http://example.com/second/api
set JSON_BODY_KEY1=firstKey
set JSON_BODY_VALUE1=firstValue
set JSON_BODY_KEY2=secondKey
set JSON_BODY_VALUE2=secondValue

:: Second API call using the access token
set CURL_COMMAND2=curl -X POST "%API_URL2%" -H "Authorization: Bearer %ACCESS_TOKEN%" -H "Content-Type: application/json" -d "{\"%JSON_BODY_KEY1%\":\"%JSON_BODY_VALUE1%\", \"%JSON_BODY_KEY2%\":\"%JSON_BODY_VALUE2%\"}"
for /f "delims=" %%j in ('%CURL_COMMAND2% ^| powershell -Command "$input | ConvertFrom-Json | Select -ExpandProperty tokenDetails"') do set TOKEN_DETAILS=%%j

:: Echo the token details from the second API call
echo Token Details: %TOKEN_DETAILS%

endlocal