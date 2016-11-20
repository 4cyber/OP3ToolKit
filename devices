
@echo off
color f0
title Detector
mode con:cols=35 lines=9
:AGAIN
cls
echo DEVICE DETECTOR
echo.
echo ID		STATUS
echo.
adb devices
fastboot devices
ping 127.0.0.1 -n 3 >nul
goto :AGAIN
