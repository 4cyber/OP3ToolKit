
@echo off
mode con:cols=80 lines=25
if Not Exist config (
mkdir config
mkdir config\delete
mkdir config\colore
)
if Not Exist file (
mkdir file
mkdir file\app
mkdir file\varie
mkdir file\rom
)
cls
set co=f0
if Exist config/colore/verde.txt set co=0a
if Exist config/colore/giallo.txt set co=0e
if Exist config/colore/bianco.txt set co=f0
color %co%
Title OnePlus 3 TK
cls
echo  ######                                                   
echo  #     # #####  ###### #    # ######  ####   ####  ###### 
echo  #     # #    # #      ##  ## #      #      #      #      
echo  ######  #    # #####  # ## # #####   ####   ####  #####  
echo  #       #####  #      #    # #           #      # #      
echo  #       #   #  #      #    # #      #    # #    # #      
echo  #       #    # ###### #    # ######  ####   ####  ######
echo.
echo.
echo E' necessario aver il debug usb abilitato
echo oltre ai driver della oneplus installati, adb
echo ed una connessione ad internet.
echo Io non mi prendo nessuna responsabilita'
echo riguardo all'uso del programma/modifiche/danni.
echo Ti consiglio caldamente di leggere "aiuto" almeno al primo avvio.
echo Continuando accetti le condizioni.
echo.
echo ToolKit creato da esclusivamente da ACyber
echo Telegram: @ACyber
echo.
echo.
pause
cls
color %co%
echo    #            #######               ######                      
echo   ##     #      #     # #    # ###### #     # #      #    #  ####  
echo  # #     #      #     # ##   # #      #     # #      #    # #      
echo    #   #####    #     # # #  # #####  ######  #      #    #  ####  
echo    #     #      #     # #  # # #      #       #      #    #      # 
echo    #     #      #     # #   ## #      #       #      #    # #    # 
echo  #####          ####### #    # ###### #       ######  ####   ####  
echo.
echo Avvio in corso...
adb\adb.exe kill-server >nul
adb\adb.exe start-server >nul
if errorlevel 1 goto :sce
set "errorlevel=0"
start cmd.exe /C devices.bat
goto menu

:menu
color %co%
cls
echo  #     # ####### #     # #     # 
echo  ##   ## #       ##    # #     # 
echo  # # # # #       # #   # #     # 
echo  #  #  # #####   #  #  # #     # 
echo  #     # #       #   # # #     # 
echo  #     # #       #    ## #     # 
echo  #     # ####### #     #  #####  
echo.
echo.
echo 1-Azioni Bootloader
echo 2-Flasha twrp / stock recovery
echo 3-Installa Supersu
echo 4-OxygenOS / Rom flash
echo 5-Decript (no wipe) [Coming soon]
echo 6-App Installer
echo 7-Aiuto
echo 8-Impostazioni
echo 0-Esci
echo.
set /p scelta= Scelta[0-8]:
if '%scelta%'=='1' goto :BOOT
if '%scelta%'=='2' goto :TWRP
if '%scelta%'=='3' goto :SUPERSU
if '%scelta%'=='4' goto :OOS
if '%scelta%'=='5' goto :DECRIPT
if '%scelta%'=='6' goto :APP
if '%scelta%'=='7' goto :HELP
if '%scelta%'=='8' goto :IMPOSTAZIONI
if '%scelta%'=='0' goto :EXIT
goto menu

:BOOT
color %co%
cls
echo  ######                                                                
echo  #     #  ####   ####  ##### #       ####    ##   #####  ###### #####  
echo  #     # #    # #    #   #   #      #    #  #  #  #    # #      #    # 
echo  ######  #    # #    #   #   #      #    # #    # #    # #####  #    # 
echo  #     # #    # #    #   #   #      #    # ###### #    # #      #####  
echo  #     # #    # #    #   #   #      #    # #    # #    # #      #   #  
echo  ######   ####   ####    #   ######  ####  #    # #####  ###### #    # 
echo.                                                                       
echo.
echo 1-Blocca bootloader
echo 2-Sblocca bootloader
echo 0-Torna al menu principale
echo.
set /p scelta= Scelta[2-0]:
if '%scelta%'=='1' goto :blocca
if '%scelta%'=='2' goto :sblocca
if '%scelta%'=='0' goto :menu
goto :BOOT

:blocca
color c0
echo.
echo.
echo Il bootloader verra' bloccato E I DATI CANCELLATI, continuare [s/n]?
echo.
set /p scelta= Scelta:
if '%scelta%'== 's' goto :bbootu
if '%scelta%'== 'n' goto :BOOT
goto BOOT

:bbootu
color %co%
echo.
echo.
adb\adb.exe reboot bootloader
ping 127.0.0.1 -n 8 >nul
adb\fastboot.exe oem lock
echo Bootloader bloccato!
echo.
pause
goto BOOT

:sblocca
color c0
echo.
echo.
echo Il bootloader verra' sbloccato E I DATI CANCELLATI, continuare [s/n]?
echo.
set /p scelta= Scelta:
if '%scelta%'== 's' goto :bbootd
if '%scelta%'== 'n' goto :BOOT
goto BOOT

:bbootd
color %co%
echo.
echo.
adb\adb.exe reboot bootloader
ping 127.0.0.1 -n 8 >nul
adb\fastboot.exe oem lock
echo Bootloader sbloccato!
echo.
pause
goto BOOT

:TWRP
cls
echo  #######                      
echo     #    #    # #####  #####  
echo     #    #    # #    # #    # 
echo     #    #    # #    # #    # 
echo     #    # ## # #####  #####  
echo     #    ##  ## #   #  #      
echo     #    #    # #    # #      
echo.
echo.
echo 1-Flasha Twrp
echo 2-Flasha recovery stock
echo 0-Torna al menu principale
echo.
set /p scelta= Scelta[2-0]:
if '%scelta%'=='1' goto ftwrp
if '%scelta%'=='2' goto fsr
if '%scelta%'=='0' goto menu
goto :TWRP

:ftwrp
cls
if Not Exist file\varie\twrp.img goto moment
echo Ricordo che il bootloader deve essere sbloccato per la modifica della recovery.
echo.
echo Prosegui solo con il bootloader sbloccato.
echo Premi un tasto per continuare il flash.
pause >nul
adb\adb.exe reboot bootloader >nul
adb\fastboot.exe flash recovery file\varie\twrp.img
if Exist config/delete/twrp.txt del file\varie\twrp.img
ping 127.0.0.1 -n 8 >nul
goto menu

:moment
cls
echo Twrp non trovata, procedo al download!
echo.
powershell Invoke-Webrequest https://www.dropbox.com/s/yzo4eep6v9tv610/twrp-3.0.2-22-oneplus3.img?dl=1 -outfile file\varie\twrp.img
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :TWRP
)
goto :ftwrp

:fsr
cls
if Not Exist file\varie\recovery.img goto moment2
echo Ricordo che il bootloader deve essere sbloccato per la modifica della recovery.
echo.
echo Prosegui solo con il bootloader sbloccato.
echo Premi un tasto per continuare il flash.
pause >nul
adb\adb.exe reboot bootloader >nul
adb\fastboot.exe flash recovery file\varie\recovery.img
if Exist config/delete/recovery.txt del file\varie\recovery.img
ping 127.0.0.1 -n 8 >nul
adb\fastboot.exe boot recovery.img
goto menu

:moment2
cls
echo Recovery stock non trovata... Attendi!
powershell.exe Invoke-Webrequest https://s3.amazonaws.com/oxygenos.oneplus.net/recovery.img -outfile file\varie\recovery.img
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :TWRP
)
echo.
goto :fsr

:SUPERSU
cls
echo   #####                               #####         
echo  #     # #    # #####  ###### #####  #     # #    # 
echo  #       #    # #    # #      #    # #       #    # 
echo   #####  #    # #    # #####  #    #  #####  #    # 
echo        # #    # #####  #      #####        # #    # 
echo  #     # #    # #      #      #   #  #     # #    # 
echo   #####   ####  #      ###### #    #  #####   ####  
echo.
echo.                                                    
echo hai gia installato la recovery?
echo [s] si, continuiamo 
echo [n] no, portami al menu recovery
echo [m] per tornare nel menu
set /p scelta= Scelta:
if '%scelta%'=='n' goto :TWRP
if '%scelta%'=='m' goto :menu
if Not Exist file\varie\supersu.zip powershell Invoke-Webrequest https://www.dropbox.com/s/kncb66amyojszzh/supersu.zip?dl=1 -outfile file\varie\supersu.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :menu
)
echo riavvio il telefono in recovery
adb\adb.exe reboot recovery >nul
echo vai in avanzate, ed abilita' la modalita' sideload.
echo premi invio per continuare
pause >nul
adb\adb.exe sideload file\varie\supersu.zip
if Exist config/delete/supersu.txt del file\varie\supersu.zip
echo.
echo ci vorra' un po' di piu' per il primo avvio, non preoccuparti!
echo.
ping 127.0.0.1 -n 8 >nul
goto menu

:OOS
cls
echo  ####### #######  #####  
echo  #     # #     # #     # 
echo  #     # #     # #       
echo  #     # #     #  #####  
echo  #     # #     #       # 
echo  #     # #     # #     # 
echo  ####### #######  #####                           
echo.
echo.
echo 1-OxygenOS 3.2.8 [6.0.1]
echo 2-OxygenOS 4.0 [7.0]
echo 3-OxygenOS Community Build
echo 4-Rom [BETA]
echo 0-Torna al menu principale
echo.
set /p scelta= Scelta[4-0]:
if '%scelta%'=='1' goto FOOS
if '%scelta%'=='2' goto FOOSN
if '%scelta%'=='3' goto SCEOOSCB
if '%scelta%'=='4' goto ROM
if '%scelta%'=='0' goto menu

:FOOSN
cls
if Not Exist file\rom\OOSN.zip goto MOOSN
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oos se vieni da altre rom (almeno system, data, cache e dalvik).
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSN.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/oxygenn.txt del file\rom\OOSN.zip >nul
goto menu

:MOOSN
echo OOSN non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest https://www.dropbox.com/s/ifxbd0kmvvmj2ci/OnePlus3Oxygen_16_OTA_035_all_1612310359_e10cadfb2af7.zip?dl=1 -outfile file\rom\OOSN.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :OOS
)
goto FOOSN

:FOOS
cls
if Not Exist file\rom\OOS.zip goto MOOS
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oos se vieni da altre rom (almeno system, data, cache e dalvik).
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOS.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/oxygen.txt del file\rom\OOS.zip >nul
goto menu

:MOOS
echo OOS non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest https://www.dropbox.com/s/anhgdpvfcizypna/OnePlus3-OxygenOS-3.2.8-full.zip?dl=1 -outfile file\rom\OOS.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :OOS
)
goto FOOS

:SCEOOSCB
cls
echo   #####  ######  
echo  #     # #     # 
echo  #       #     # 
echo  #       ######  
echo  #       #     # 
echo  #     # #     # 
echo   #####  ######  
echo.
echo 1-Open Beta 2
echo 2-Open Beta 3
echo 3-Open Beta 4
echo 4-Open Beta 5
echo 5-Open Beta 6
echo 6-Open Beta 7
echo 7-Open Beta 8
echo 8-Open Beta 9
echo 9-Open Beta 10
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta[9-0]:
if '%scelta%'=='1' goto FOOSCB2
if '%scelta%'=='2' goto FOOSCB3
if '%scelta%'=='3' goto FOOSCB4
if '%scelta%'=='4' goto FOOSCB5
if '%scelta%'=='5' goto FOOSCB6
if '%scelta%'=='6' goto FOOSCB7
if '%scelta%'=='7' goto FOOSCB8
if '%scelta%'=='8' goto FOOSCB9
if '%scelta%'=='9' goto FOOSCB10
if '%scelta%'=='0' goto OOS
goto :SCEOOSCB

:FOOSCB2
cls
if Not Exist file\rom\OOSCB2.zip goto MOOSCB2
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB2.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB2.zip >nul
goto menu

:MOOSCB2
echo OOS CB 2 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_002_all_1608301010_6ee96e2225c34a71.zip -outfile file\rom\OOSCB2.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB2

:FOOSCB3
cls
if Not Exist file\rom\OOSCB3.zip goto MOOSCB3
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB3.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB3.zip >nul
goto menu

:MOOSCB3
echo OOS CB 3 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://s3.amazonaws.com/oxygenos.oneplus.net/OnePlus3Oxygen_16_OTA_003_all_1609142002_2a17363c90cd462e.zip -outfile file\rom\OOSCB3.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB3

:FOOSCB4
cls
if Not Exist file\rom\OOSCB4.zip goto MOOSCB4
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB4.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB4.zip >nul
goto menu

:MOOSCB4
echo OOS CB 4 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://s3.amazonaws.com/oxygenos.oneplus.net/OnePlus3Oxygen_16_OTA_004_all_1609281647_e6a1e7e2d11b4626.zip -outfile file\rom\OOSCB4.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB4

:FOOSCB5
cls
if Not Exist file\rom\OOSCB5.zip goto MOOSCB5
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB5.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB5.zip >nul
goto menu

:MOOSCB5
echo OOS CB 5 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_006_all_1610172123_2a54215ec1fa483e.zip -outfile file\rom\OOSCB5.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB5

:FOOSCB6
cls
if Not Exist file\rom\OOSCB6.zip goto MOOSCB6
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB6.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB6.zip >nul
goto menu

:MOOSCB6
echo OOS CB 6 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_007_all_1610310039_bc5bc09fd9af4ceb.zip -outfile file\rom\OOSCB6.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB6

:FOOSCB7
cls
if Not Exist file\rom\OOSCB7.zip goto MOOSCB7
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB7.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB7.zip >nul
goto menu

:MOOSCB7
echo OOS CB 7 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_009_all_1611161152_86fe98f7ebf24259.zip -outfile file\rom\OOSCB7.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB7

:FOOSCB8
cls
if Not Exist file\rom\OOSCB8.zip goto MOOSCB8
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB8.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB8.zip >nul
goto menu

:MOOSCB8
echo OOS CB 8 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest https://www.dropbox.com/s/3fd3w4y4v98q308/oos-cb8.zip?dl=1 -outfile file\rom\OOSCB8.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB8

:FOOSCB9
cls
if Not Exist file\rom\OOSCB9.zip goto MOOSCB9
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB9.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB9.zip >nul
goto menu

:MOOSCB9
echo OOS CB 9 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_017_all_1612141448_c46e72f660ae4891.zip -outfile file\rom\OOSCB9.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB9

:FOOSCB10
cls
if Not Exist file\rom\OOSCB10.zip goto MOOSCB10
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb\adb.exe reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OOSCB10.zip
if errorlevel 1 (
set "errorlevel=0"
echo Qualcosa e' andato storto con il flash...
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
if Exist config/delete/ooscb.txt del file\rom\OOSCB10.zip >nul
goto menu

:MOOSCB10
echo OOS CB 10 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_018_all_1612281257_d8107904d7734248.zip -outfile file\rom\OOSCB10.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :SCEOOSCB
)
goto FOOSCB10

:ROM
cls
echo  ######  ####### #     # 
echo  #     # #     # ##   ## 
echo  #     # #     # # # # # 
echo  ######  #     # #  #  # 
echo  #   #   #     # #     # 
echo  #    #  #     # #     # 
echo  #     # ####### #     # 
echo.
if Not Exist OGAPPS.zip echo Pacchetto OGAPPS.zip non trovato!
echo.
echo 1-AICP (28-12-2016) (7.1)
echo 2-CyanogenMOD (25-12-2016) (7.1) [R.I.P]
echo 3-FreedomOS
echo 4-Apri il sito opengapps.org
echo 0-Torna a Menu OOS
echo.
set /p scelta= Scelta[4-0]:
if '%scelta%'=='1' goto AICPMENU
if '%scelta%'=='2' goto CMMENU
if '%scelta%'=='3' goto FREEDOM
if '%scelta%'=='4' (
echo.
echo Scarica ARM64, la versione che preferisci per la versione di android che ti serve.
echo Rinominalo GAPPS.zip e mettilo nella cartella del toolkit.
ping 127.0.0.1 -n 5 >nul
start http://opengapps.org/
goto :ROM
)
if '%scelta%'=='0' goto :OOS
goto :ROM

:GAPPSAICP
cls
echo Verra' scaricato il pacchetto stock (670mb circa), se preferisci un pacchetto diverso scaricalo da "opengapps.org", rinominalo OGAPPS.zip e mettilo nella stessa directory del toolkit.
echo.
echo Se accetti il pacchetto Stock premi un tasto per il download automatico, altrimenti premi [P] per tornare al menu precedente.
set /p scelta= Scelta:
if '%scelta%'=='p' goto :ROM
If Not Exist file\rom\GAPPS.zip powershell Invoke-Webrequest https://www.dropbox.com/s/bhg861d3i99l9h7/open_gapps-arm64-7.1-stock-20161220.zip?dl=1 -outfile file\rom\OGAPPS.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
echo.
echo Fatto, attendi..
ping 127.0.0.1 -n 3 >nul
goto :FAICP

:GAPPSCM
cls
echo Verra' scaricato il pacchetto stock (670mb circa), se preferisci un pacchetto diverso scaricalo da "opengapps.org", rinominalo OGAPPS.zip e mettilo nella stessa directory del toolkit.
echo.
echo Se accetti il pacchetto Stock premi un tasto per il download automatico, altrimenti premi [P] per tornare al menu precedente.
set /p scelta= Scelta:
if '%scelta%'=='p' goto :ROM
If Not Exist file\rom\GAPPS.zip powershell Invoke-Webrequest https://www.dropbox.com/s/bhg861d3i99l9h7/open_gapps-arm64-7.1-stock-20161220.zip?dl=1 -outfile file\rom\OGAPPS.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
echo.
echo Fatto, attendi..
ping 127.0.0.1 -n 3 >nul
goto :FCM

:AICPMENU
cls
echo 1-Dirty Flash (flasha solo la rom)
echo 2-Flash completo (flasha rom + gapps)
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta[2-0]:
if '%scelta%'=='1' goto DAICP
if '%scelta%'=='2' goto FAICP
if '%scelta%'=='0' goto :ROM
goto :AICPMENU

:FAICP
cls
if Not Exist file\rom\AICP.zip goto :AICPDD
if Not Exist file\rom\OGAPPS.zip goto :GAPPSAICP
adb\adb.exe reboot recovery >nul
echo effettua i wipe (almeno system,data,cache e dalvik) e poi manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\AICP.zip
echo rimanda il telefono in sideload.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\OGAPPS.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
if Exist config/delete/aicp.txt del file\rom\AICP.zip >nul
if Exist config/delete/ogapps.txt del file\rom\OGAPPS.zip >nul
goto menu

:DAICP
cls
if Not Exist file\rom\AICP.zip goto :AICPD
adb\adb.exe reboot recovery >nul
echo Manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe file\rom\sideload AICP.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
if Exist config/delete/aicp.txt del file\rom\AICP.zip >nul
goto menu

:AICPD
echo AICP.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest http://mirror3.aicp-rom.com/oneplus3/NIGHTLY/aicp_oneplus3_n-12.1-NIGHTLY-20161228.zip -outfile file\rom\AICP.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :DAICP

:AICPDD
echo AICP.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest http://mirror1.aicp-rom.com/oneplus3/NIGHTLY/aicp_oneplus3_n-12.1-NIGHTLY-20161223.zip -outfile file\rom\AICP.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :FAICP

:CMMENU
cls
echo 1-Dirty Flash (flasha solo la rom)
echo 2-Flash completo (flasha rom + gapps)
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta[2-0]:
if '%scelta%'=='1' goto DCM
if '%scelta%'=='2' goto FCM
if '%scelta%'=='0' goto :ROM
goto :CMMENU

:FCM
cls
if Not Exist file\rom\CM.zip goto :CMD
If Not Exist file\rom\OGAPPS.zip goto :GAPPSCM
adb\adb.exe reboot recovery >nul
echo effettua i wipe (almeno system,data,cache e dalvik) e poi manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\CM.zip
echo rimanda il telefono in sideload.
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe file\rom\sideload OGAPPS.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
if Exist config/delete/cm.txt del file\rom\CM.zip >nul
if Exist config/delete/ogapps.txt del file\rom\OGAPPS.zip >nul
goto menu

:DCM
cls
if Not Exist file\rom\CM.zip goto :CMD
adb\adb.exe reboot recovery >nul
echo Manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\CM.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
if Exist config/delete/cm.txt del file\rom\CM.zip >nul
goto menu

:CMD
echo CM.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest https://download.cyanogenmod.org/get/jenkins/189935/cm-14.1-20161225-NIGHTLY-oneplus3.zip -outfile file\rom\CM.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :DCM

:CMDD
echo CM.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest https://download.cyanogenmod.org/get/jenkins/189760/cm-14.1-20161223-NIGHTLY-oneplus3.zip -outfile file\rom\CM.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :FCM

:FREEDOM
cls
echo 1-FreedomOS (6.0.1)
echo 2-FreedomOS CE (7.0)
echo 3-Flash stock bootscreen
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta[3-0]:
if '%scelta%'=='1' goto :FOS
if '%scelta%'=='2' goto :FOSCE
if '%scelta%'=='3' goto :BS
if '%scelta%'=='0' goto :ROM
goto :FREEDOM

:FOS
cls
if Not Exist file\rom\FREEDOMOS.zip goto :DF
adb\adb.exe reboot recovery >nul
echo Se vieni da un altra rom effettua i wipe (almeno system,data,cache e dalvik) 
echo Manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\FREEDOMOS.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
if Exist config/delete/freedom.txt del file\rom\FREEDOM.zip >nul
goto menu

:FOSCE
cls
if Not Exist file\rom\FREEDOMOSCE.zip goto :DFCE
adb\adb.exe reboot recovery >nul
echo Se vieni da un altra rom effettua i wipe (almeno system,data,cache e dalvik) 
echo Manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb\adb.exe sideload file\rom\FREEDOMOSCE.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
if Exist config/delete/freedomce.txt del file\rom\FREEDOMCE.zip >nul
goto menu

:DF
echo FREEDOM.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest http://nevax.one/files/OnePlus3/FreedomOS/FreedomOS-op3-nevax-1.7-signed.zip -outfile file\rom\FREEDOM.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :FOS

:DFCE
echo FREEDOMCE.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest http://nevax.one/files/OnePlus3/FreedomOS_CE/FreedomOS-CE-op3-nevax-2.1-signed.zip -outfile file\rom\FREEDOMCE.zip
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :FOSCE

:BS
echo.
echo Questo flashera' la bootscreen ufficiale oneplus, premi [a] per annullare o qualunque altro tasto per continuare.
set /p scelta= Scelta:
if '%scelta%'=='a' goto :FREEDOM
if Not Exist file\rom\oos-bootscreen.zip (
powershell.exe Invoke-Webrequest https://www.dropbox.com/s/lo3znv31t0m3lvk/oos-bootscreen.zip?dl=1 -outfile file\rom\oos-bootscreen.zip
)
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :ROM
)
adb\adb.exe reboot recovery >nul
echo Vai in recovery, avanzate e sideload.
echo premi un tasto quando sei in sideload
pause >nul
adb\adb.exe sideload file\rom\oos-bootscreen.zip >nul
echo fatto
ping 127.0.0.1 -n 3 >nul
if Exist config/delete/fbs.txt del file\rom\oos-bootscreen.zip >nul
goto :FREEDOM

:DECRIPT
echo.
echo LA FUNZIONE ARRIVERA' PRESTO!
ping 127.0.0.1 -n 8 >nul
goto menu

:APP
cls
echo     #                  
echo    # #   #####  #####  
echo   #   #  #    # #    # 
echo  #     # #    # #    # 
echo  ####### #####  #####  
echo  #     # #      #      
echo  #     # #      #      
echo.
echo (utilizzo di adb install)
echo.
echo 1-Lucky patcher (v6.3.7)
echo 2-AdAway
echo 3-Spotify (tablet mod v7.0.0.1369)
echo 4-Xposed Installer (v3.1.1 Lollipop-Marshmallow)
echo 0-Torna al menu
echo.
set /p scelta= Scelta[4-0]:
if '%scelta%'=='1' goto :lp
if '%scelta%'=='2' goto :ad
if '%scelta%'=='3' goto :spotify
if '%scelta%'=='4' goto :xposed
if '%scelta%'=='0' goto :menu
goto :APP

:lp
echo.
echo Attendi.
if Not Exist file\app\lucky.apk powershell Invoke-Webrequest https://www.dropbox.com/s/pc7931zdhuvreuu/Lucky%20Patcher%20v6.3.7.apk?dl=1 -outfile file\app\lucky.apk
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :APP
)
adb\adb.exe install file\app\lucky.apk
echo.
if Exist config/delete/lucky.txt del file\app\lucky.apk >nul
ping 127.0.0.1 -n 3 >nul
goto :APP

:ad
echo.
echo Attendi.
if Not Exist file\app\adaway.apk powershell Invoke-Webrequest https://www.dropbox.com/s/d8xwds6qftq846r/AdAway-release_Build-Nov.19.2016.apk?dl=1 -outfile file\app\adaway.apk
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :APP
)
adb\adb.exe install file\app\adaway.apk
echo.
if Exist config/delete/adaway.txt del file\app\adaway.apk >nul
ping 127.0.0.1 -n 3 >nul
goto :APP

:spotify
echo.
echo Attendi.
if Not Exist file\app\spotify.apk powershell Invoke-Webrequest https://www.dropbox.com/s/dlxdt1av0eu4hhs/Spotify%20Music%20v7.0.0.1369%20Mod.apk?dl=1 -outfile file\app\spotify.apk
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :APP
)
adb\adb.exe install file\app\spotify.apk
echo.
if Exist config/delete/spotify.txt del file\app\spotify.apk >nul
ping 127.0.0.1 -n 3 >nul
goto :APP

:xposed
echo.
echo Attendi.
if Not Exist file\app\xposed.apk powershell Invoke-Webrequest https://www.dropbox.com/s/qcd36121qi4mlds/XposedInstaller_3.1.1.apk?dl=1 -outfile file\app\xposed.apk
if errorlevel 1 (
set "errorlevel=0"
echo Il Download sembra essere fallito, riprova, se il problema persiste segnalamelo e provvedero' a sistemare il link se possibile.
ping 127.0.0.1 -n 5 >nul
goto :APP
)
adb\adb.exe install file\app\xposed.apk
echo.
if Exist config/delete/xposed.txt del file\app\xposed.apk >nul
ping 127.0.0.1 -n 3 >nul
goto :APP

:HELP
cls
echo 1-vai a changelog/in arrivo
echo 2-guida e F.A.Q
echo 3-Aiutami
echo 4-Apri la pagina di download del toolkit.
echo 0-torna al menu principale
echo.
echo.
set /p scelta= Scelta[4-0]:
if '%scelta%'=='1' start changelog.txt
if '%scelta%'=='2' goto :GUIDA
if '%scelta%'=='3' goto :AIUTAMI
if '%scelta%'=='4' start https://drive.google.com/open?id=0B4XyfvGE5fIoRjlxaFBVRzFaQjA
if '%scelta%'=='0' goto :menu
goto :HELP

:AIUTAMI
cls
echo 1-Donazione PayPal
echo 2-Link invito dropbox (per hostare)
echo 3-Invio consigli
echo 0-torna al menu precedente
echo.
set /p scelta= Scelta[3-0]:
if '%scelta%'=='1' (
echo Ti ringrazio veramente moltissimo!
ping 127.0.0.1 -n 3 >nul
start https://www.paypal.me/ACyber
)
if '%scelta%'=='2' (
echo Un link invito a dropbox, mi servira' per hostare piu' file possibili come rom ecc.
ping 127.0.0.1 -n 3 >nul
https://db.tt/MjjWKZDI
)
if '%scelta%'=='3' (
echo I consigli li adoro specialmente se accompagnati da esempi direttamente in batch, contattatemi via telegram inviando le idee o lo script.
echo.
pause
)
if '%scelta%'=='0' goto :HELP
goto :AIUTAMI

:GUIDA
cls
echo -COME COMINCIARE PER MODIFICARE IL TELEFONO?
echo E' piu semplice di quello che sembra.
echo 1-Sblocco bootloader (cancellera i dati del telefono)
echo 2-installazione recovery twrp
echo 3-flash supersu.
echo.
echo -UNA VOLTA MODIFICATO COSA DEVO FARE PER AGGIORNARE LA OXYGEN?
echo Ancora una volta e' molto semplice, devi solo scaricare il pacchetto e flasharlo in recovery senza nessun wipe.
echo Questo rimuovera' il root, puoi installare supersu dopo il flash per riottenere i permessi di root.
echo.
echo -SE DOVESSI AVERE ALTRE DOMANDE?
echo Puoi contattarmi su telegram [@ACyber]
echo.
echo Premi un tasto per tornare al menu AIUTO
pause >nul
goto :HELP

:IMPOSTAZIONI
cls
echo  ###                                                                   
echo   #  #    # #####   ####   ####  #####   ##   ###### #  ####  #    # # 
echo   #  ##  ## #    # #    # #        #    #  #      #  # #    # ##   # # 
echo   #  # ## # #    # #    #  ####    #   #    #    #   # #    # # #  # # 
echo   #  #    # #####  #    #      #   #   ######   #    # #    # #  # # # 
echo   #  #    # #      #    # #    #   #   #    #  #     # #    # #   ## # 
echo  ### #    # #       ####   ####    #   #    # ###### #  ####  #    # # 
echo.
echo.
echo 1-Tema
echo 2-Cancella dopo download
echo 0-Torna al menu principale
echo.
set /p scelta= Scelta[2-0]:
if '%scelta%'=='1' goto :CCOLOR
if '%scelta%'=='2' goto :DEL
if '%scelta%'=='0' goto :menu
goto :IMPOSTAZIONI

:CCOLOR
color %co%
cls
echo TEMI
echo.
echo 1-Schermo [NERO] con scritte [VERDI]
echo 2-Schermo [NERO] con scritte [GIALLE]
echo 3-Schermo [BIANCO] con scritte [NERE] (consigliato)
echo 4-Schermo [NERO] con scritte [ROSSE]
echo 5-Schermo [BIANCO] con scritte [ROSSE]
echo 0-Torna al menu precedente
set /p scelta= Scelta[3-0]:
if '%scelta%'=='1' (
set co=0a >> config/colore/verde.txt
del config\colore\giallo.txt >nul
del config\colore\bianco.txt >nul
del config\colore\brosso.txt >nul
del config\colore\nrosso.txt >nul
)
if '%scelta%'=='2' (
set co=0e >> config/colore/giallo.txt
del config\colore\verde.txt >nul
del config\colore\bianco.txt >nul
del config\colore\brosso.txt >nul
del config\colore\nrosso.txt >nul
)
if '%scelta%'=='3' (
set co=f0 >> config/colore/bianco.txt
del config\colore\verde.txt >nul
del config\colore\giallo.txt >nul
del config\colore\brosso.txt >nul
del config\colore\nrosso.txt >nul
)
if '%scelta%'=='4' (
set co=0c >> config/colore/nrosso.txt
del config\colore\verde.txt >nul
del config\colore\giallo.txt >nul
del config\colore\bianco.txt >nul
del config\colore\brosso.txt >nul
)
if '%scelta%'=='5' (
set co=fc >> config/colore/brosso.txt
del config\colore\nrosso.txt >nul
del config\colore\verde.txt >nul
del config\colore\giallo.txt >nul
del config\colore\bianco.txt >nul
)
if '%scelta%'=='0' goto :IMPOSTAZIONI
goto :CCOLOR

:DEL
cls
echo Impostazioni eliminazioni
echo.
echo eliminazioni dei file dopo il download dal toolkit.
echo.
echo.
echo 1-Varie
echo 2-Rom
echo 3-App
echo 0-Torna al menu precedente
set /p scelta= Scelta[3-0]:
if '%scelta%'=='1' goto :DELVARIE
if '%scelta%'=='2' goto :DELROM
if '%scelta%'=='3' goto :DELAPP
if '%scelta%'=='0' goto :IMPOSTAZIONI
goto :DEL

:DELVARIE
cls
echo VARIE
echo.
echo.
if Exist config/delete/twrp.txt (
set twrp=on
) else (
set twrp=off
)
echo 1-twrp [%twrp%]
if Exist config/delete/recovery.txt (
set recovery=on
) else (
set recovery=off
)
echo 2-recovery [%recovery%]
if Exist config/delete/supersu.txt (
set supersu=on
) else (
set supersu=off
)
echo 3-supersu [%supersu%]
echo 4-attiva tutto
echo 5-disattiva tutto
echo 0-torna al menu precedente
echo.
set /p scelta= Scelta[5-0]:
if '%scelta%'=='1' if Exist config/delete/twrp.txt (
del config\delete\twrp.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\twrp.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='2' if Exist config/delete/recovery.txt (
del config\delete\recovery.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\recovery.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='3' if Exist config/delete/supersu.txt (
del config\delete\supersu.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\supersu.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='4' (
if Not Exist config\delete\twrp.txt echo. >> config\delete\twrp.txt
if Not Exist config\delete\recovery.txt echo. >> config\delete\recovery.txt
if Not Exist config\delete\supersu.txt echo. >> config\delete\supersu.txt
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='5' (
if Exist config\delete\twrp.txt del config\delete\twrp.txt
if Exist config\delete\recovery.txt del config\delete\recovery.txt
if Exist config\delete\supersu.txt del config\delete\supersu.txt
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='0' goto :DEL
goto :DELVARIE

:DELROM
cls
echo ROM
echo.
echo.
if Exist config/delete/oxygen.txt (
set oxygen=on
) else (
set oxygen=off
)
echo 1-OxygenOS [%oxygen%]
if Exist config/delete/ooscb.txt (
set ooscb=on
) else (
set ooscb=off
)
echo 2-OxygenOS CB [%ooscb%]
if Exist config/delete/aicp.txt (
set aicp=on
) else (
set aicp=off
)
echo 3-Aicp [%aicp%]
if Exist config/delete/cm.txt (
set cm=on
) else (
set cm=off
)
echo 4-CyanogenMOD [%cm%]
if Exist config/delete/ogapps.txt (
set ogapps=on
) else (
set ogapps=off
)
echo 5-OpenGapps [%ogapps%]
if Exist config/delete/freedom.txt (
set freedom=on
) else (
set freedom=off
)
echo 6-FreedomOS [%freedom%]
if Exist config/delete/freedomce.txt (
set freedomce=on
) else (
set freedomce=off
)
echo 7-FreedomOS CE [%freedomce%]
if Exist config/delete/fbs.txt (
set fbs=on
) else (
set fbs=off
)
echo 8-FreedomBootScreen [%fbs%]
if Exist config/delete/oxygenn.txt (
set oxygenn=on
) else (
set oxygenn=off
)
echo 9-OxygenOS N [%oxygenn%]
echo 10-Attiva tutto
echo 11-disattiva tutto
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta[11-0]:
if '%scelta%'=='1' if Exist config/delete/oxygen.txt (
del config\delete\oxygen.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\oxygen.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='2' if Exist config/delete/ooscb.txt (
del config\delete\ooscb.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\ooscb.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='3' if Exist config/delete/aicp.txt (
del config\delete\aicp.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\aicp.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='4' if Exist config/delete/cm.txt (
del config\delete\cm.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\cm.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='5' if Exist config/delete/ogapps.txt (
del config\delete\ogapps.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\ogapps.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='6' if Exist config/delete/freedom.txt (
del config\delete\freedom.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\freedom.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='7' if Exist config/delete/freedomce.txt (
del config\delete\freedomce.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\freedomce.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='8' if Exist config/delete/fbs.txt (
del config\delete\fbs.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\fbs.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='9' if Exist config/delete/oxygenn.txt (
del config\delete\oxygenn.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\oxygenn.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='10' (
if Not Exist config\delete\oxygen.txt echo. >> config\delete\oxygen.txt
if Not Exist config\delete\ooscb.txt echo. >> config\delete\ooscb.txt
if Not Exist config\delete\aicp.txt echo. >> config\delete\aicp.txt
if Not Exist config\delete\cm.txt echo. >> config\delete\cm.txt
if Not Exist config\delete\ogapps.txt echo. >> config\delete\ogapps.txt
if Not Exist config\delete\freedom.txt echo. >> config\delete\freedom.txt
if Not Exist config\delete\freedomce.txt echo. >> config\delete\freedomce.txt
if Not Exist config\delete\fbs.txt echo. >> config\delete\fbs.txt
if Not Exist config\delete\oxygenn.txt echo. >> config\delete\oxygenn.txt
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='11' (
if Exist config\delete\oxygen.txt del config\delete\oxygen.txt
if Exist config\delete\ooscb.txt del config\delete\ooscb.txt
if Exist config\delete\aicp.txt del config\delete\aicp.txt
if Exist config\delete\cm.txt del config\delete\cm.txt
if Exist config\delete\ogapps.txt del config\delete\ogapps.txt
if Exist config\delete\freedom.txt del config\delete\freedom.txt
if Exist config\delete\freedomce.txt del config\delete\freedomce.txt
if Exist config\delete\fbs.txt del config\delete\fbs.txt
if Exist config\delete\oxygenn.txt del config\delete\oxygenn.txt
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='0' goto :DEL
goto :DELROM

:DELAPP
cls
echo APP
echo.
echo.
if Exist config/delete/lucky.txt (
set lucky=on
) else (
set lucky=off
)
echo 1-Lucky Patcher [%lucky%]
if Exist config/delete/adaway.txt (
set adaway=on
) else (
set adaway=off
)
echo 2-Adaway [%adaway%]
if Exist config/delete/spotify.txt (
set spotify=on
) else (
set spotify=off
)
echo 3-Spotify [%spotify%]
if Exist config/delete/xposed.txt (
set xposed=on
) else (
set xposed=off
)
echo 4-Xposed [%xposed%]
echo 5-Attiva tutto
echo 6-Disabilita tutto
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta[6-0]:
if '%scelta%'=='1' if Exist config/delete/lucky.txt (
del config\delete\lucky.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\lucky.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='2' if Exist config/delete/adaway.txt (
del config\delete\adaway.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\adaway.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='3' if Exist config/delete/spotify.txt (
del config\delete\spotify.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\spotify.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='4' if Exist config/delete/xposed.txt (
del config\delete\xposed.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
) else (
echo. >> config\delete\xposed.txt
echo.
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='5' (
if Not Exist config\delete\lucky.txt echo. >> config\delete\lucky.txt
if Not Exist config\delete\adaway.txt echo. >> config\delete\adaway.txt
if Not Exist config\delete\spotify.txt echo. >> config\delete\spotify.txt
if Not Exist config\delete\xposed.txt echo. >> config\delete\xposed.txt
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='6' (
if Exist config\delete\lucky.txt del config\delete\lucky.txt
if Exist config\delete\adaway.txt del config\delete\adaway.txt
if Exist config\delete\spotify.txt del config\delete\spotify.txt
if Exist config\delete\xposed.txt del config\delete\xposed.txt
echo Fatto, attendi...
ping 127.0.0.1 -n 3 >nul
)
if '%scelta%'=='0' goto :DEL
goto :DELAPP

:sce
cls
echo Questo programma richiede adb che non sembra funzionare, riscarica il programma come ti e' possibile.
ping 127.0.0.1 -n 6 >nul
goto :FEXIT

:EXIT
echo.
echo Ci vediamo!
echo Spengo il server adb.
adb\adb.exe kill-server
ping 127.0.0.1 -n 3 >nul

:FEXIT
cls
