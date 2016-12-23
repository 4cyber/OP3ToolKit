@echo off
title Detector
mode con:cols=35 lines=9
color f0
:AGAIN
if exist verde.txt color 0a
if exist giallo.txt color 0e
if exist bianco.txt color f0
del verde.txt >nul
del giallo.txt >nul
del bianco.txt >nul
cls
echo DEVICE DETECTOR
echo.
echo ID		STATUS
echo.
adb devices
fastboot devices
ping 127.0.0.1 -n 3 >nul
goto :AGAIN
