@echo off
mode 40,20
title NETWORK INFO

Color 0a

echo LOADING NETWORK INFO...

:loop

:: don't need timeout cause ping command takes time anyway
:: timeout /t 1 >nul

for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| find /v "BSSID"') do set ssid=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "State"') do set state=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set signal=%%a
for /f "tokens=4 delims==" %%a in ('ping -n 2 8.8.8.8 ^| find "Average"') do set ping=%%a
:: -n 2 is perfect as delay

cls

echo   NETWORK INFO:
echo   -----------------------
echo   SSID:%ssid%
echo   State:%state%
echo   Signal:%signal%
echo   Ping (32 Bytes):%ping%

goto loop





pause