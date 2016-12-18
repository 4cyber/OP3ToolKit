@echo off
cls
color f0
title installer
echo Comincio l'installazione, attendi...
if Not Exist adb-setup-1.4.3.exe powershell.exe Invoke-Webrequest https://www.dropbox.com/s/duofwss02brdbpv/adb-setup-1.4.3.exe?dl=1 -outfile adb-setup-1.4.3.exe
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :FEXIT
)
start adb-setup-1.4.3.exe
if Not Exist OnePlus_USB_Drivers_Setup.exe powershell.exe Invoke-Webrequest https://www.dropbox.com/s/d9rn1iss7h5e1k1/OnePlus_USB_Drivers_Setup.exe?dl=1 -outfile OnePlus_USB_Drivers_Setup.exe
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :FEXIT
)
start OnePlus_USB_Drivers_Setup.exe
echo Premi un tasto alla fine dell'installazione dei driver.
pause >nul
start cmd.exe /C Toolkit.bat
goto :EXIT

:FEXIT
echo Qualcosa e' andato storto.
ping 127.0.0.1 -n 5 >nul

:EXIT
cls
