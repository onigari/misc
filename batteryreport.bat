powercfg /batteryreport 
battery-report.html
@echo off
set /p c="Delete? (y/n): "
if %c%==y (del battery-report.html)
if %c%==Y (del battery-report.html)
if %c%==1 (del battery-report.html)