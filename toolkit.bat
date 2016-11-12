
@echo off
cls
color f0
Title OnePlus 3 TK
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
echo riguardo all'uso del programma/modifiche/danni
echo Continuando accetti le condizioni.
echo.
echo ToolKit creato da Andrea Belli
echo Telegram: @ACyber
echo.
echo.
pause
cls
echo AVVIO ADB
echo.
adb start-server
goto menu

:menu
color f0
cls
echo  #     # ####### #     # #     # 
echo  ##   ## #       ##    # #     # 
echo  # # # # #       # #   # #     # 
echo  #  #  # #####   #  #  # #     # 
echo  #     # #       #   # # #     # 
echo  #     # #       #    ## #     # 
echo  #     # ####### #     #  #####  
echo.
adb devices
echo.
echo 1-Azioni Bootloader
echo 2-Flasha twrp / stock recovery
echo 3-Installa Supersu
echo 4-OxygenOS / Rom flash
echo 5-Decript (no wipe) [Coming soon]
echo 0-Esci
echo.
set /p scelta= Scelta:
if '%scelta%'=='1' goto :BOOT
if '%scelta%'=='2' goto :TWRP
if '%scelta%'=='3' goto :SUPERSU
if '%scelta%'=='4' goto :OOS
if '%scelta%'=='5' goto :DECRIPT
if '%scelta%'=='0' goto :EXIT
goto menu

:BOOT
color f0
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
set /p scelta= Scelta:
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
color f0
echo.
echo.
adb reboot bootloader
ping 127.0.0.1 -n 8 >nul
fastboot oem lock
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
color f0
echo.
echo.
adb reboot bootloader
ping 127.0.0.1 -n 8 >nul
fastboot oem lock
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
set /p scelta= Scelta:
if '%scelta%'=='1' goto ftwrp
if '%scelta%'=='2' goto fsr
if '%scelta%'=='0' goto menu
goto :TWRP

:ftwrp
cls
if Not Exist twrp.img goto moment
echo Ricordo che il bootloader deve essere sbloccato per la modifica della recovery.
echo.
echo Prosegui solo con il bootloader sbloccato.
echo Premi un tasto per continuare il flash.
pause >nul
adb reboot bootloader >nul
fastboot flash recovery twrp.img
ping 127.0.0.1 -n 8 >nul
fastboot reboot recovery
goto menu

:moment
cls
echo Twrp non trovata, procedo al download!
echo.
powershell Invoke-Webrequest https://www.dropbox.com/s/y4s161eq1df4sti/twrp-3.0.2-1-oneplus3.img?dl=1 -outfile twrp.img
goto :ftwrp

:fsr
cls
if Not Exist recovery.img goto moment2
echo Ricordo che il bootloader deve essere sbloccato per la modifica della recovery.
echo.
echo Prosegui solo con il bootloader sbloccato.
echo Premi un tasto per continuare il flash.
pause >nul
adb reboot bootloader >nul
fastboot flash recovery recovery.img
ping 127.0.0.1 -n 8 >nul
fastboot boot recovery.img
goto menu

:moment2
cls
echo Recovery non trovata... Attendi!
powershell.exe Invoke-Webrequest https://s3.amazonaws.com/oxygenos.oneplus.net/recovery.img -outfile recovery.img
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
echo hai gia installato la recovery? premi [s] per continuare o [n] per andare nel menu recovery
set /p scelta= Scelta:
if '%scelta%'=='n' goto :TWRP
if Not Exist supersu.zip powershell Invoke-Webrequest https://s3-us-west-2.amazonaws.com/supersu/download/zip/SuperSU-v2.78-201609011115.zip -outfile supersu.zip
echo riavvio il telefono in recovery
adb reboot recovery >nul
echo vai in avanzate, ed abilita' la modalita' sideload.
echo premi invio per continuare
pause >nul
adb sideload supersu.zip
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
echo 1-OxygenOS 3.2.7
echo 2-OxygenOS CB 3.5.5
echo 3-Rom [BETA]
echo 0-Torna al menu principale
echo.
set /p scelta= Scelta:
if '%scelta%'=='1' goto FOOS
if '%scelta%'=='2' goto FOOSCB
if '%scelta%'=='3' goto ROM
if '%scelta%'=='0' goto menu

:FOOS
cls
if Not Exist OOS.zip goto MOOS
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oos (almeno system, data, cache e dalvik).
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOS.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
goto menu

:MOOS
echo OOS non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://bit.ly/2f1YABC -outfile OOS.zip
goto FOOS

:FOOSCB
cls
if Not Exist OOSCB.zip goto MOOSCB
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB /almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOSCB.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
goto menu

:MOOSCB
echo OOS CB non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_007_all_1610310039_bc5bc09fd9af4ceb.zip -outfile OOSCB.zip
goto FOOSCB

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
echo 1-AICP (11-11-2016) (7.1)
echo 2-CyanogenMOD (11-11-2016) (7.1)
echo 3-FreedomOS () [coming soon]
echo 4-Apri il sito opengapps.org / scarica aroma
echo 0-Torna a Menu OOS
echo.
set /p scelta= Scelta:
if '%scelta%'=='1' goto AICPMENU
if '%scelta%'=='2' goto CMMENU
if '%scelta%'=='4' start http://opengapps.org/
if '%scelta%'=='0' goto :OOS
goto :ROM

:GAPPS
cls
echo Verra' scaricato il pacchetto aroma (dal peso di 892 mb), se preferisci un pacchetto diverso scaricalo da "opengapps.org", rinominalo OGAPPS.zip e mettilo nella stessa directory del toolkit.
echo.
echo Se accetti il pacchetto Aroma premi un tasto per il download automatico.
pause >nul
powershell Invoke-Webrequest https://www.dropbox.com/s/q8ho45j3wus0kb6/open_gapps-arm64-7.1-aroma-20161111.zip?dl=1 -outfile OGAPPS.zip
echo.
echo Fatto, attendi..
ping 127.0.0.1 -n 3 >nul
goto :ROM

:AICPMENU
cls
echo 1-Dirty Flash (flasha solo la rom)
echo 2-Flash completo (flasha rom + gapps)
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta:
if '%scelta%'=='1' goto DAICP
if '%scelta%'=='2' goto FAICP
if '%scelta%'=='0' goto :ROM
goto :AICPMENU

:FAICP
cls
if Not Exist AICP.zip goto :AICPD
adb reboot recovery >nul
echo effettua i wipe (almeno system,data,cache e dalvik) e poi manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload AICP.zip
echo rimanda il telefono in sideload.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OGAPPS.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
goto menu

:DAICP
cls
if Not Exist AICP.zip goto :AICPD
adb reboot recovery >nul
echo Manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload AICP.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
goto menu

:AICPD
echo AICP.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest http://mirror2.aicp-rom.com/oneplus3/NIGHTLY/aicp_oneplus3_n-12.1-NIGHTLY-20161111.zip -outfile AICP.zip
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :AICP

:CMMENU
cls
echo 1-Dirty Flash (flasha solo la rom)
echo 2-Flash completo (flasha rom + gapps)
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta:
if '%scelta%'=='1' goto DCM
if '%scelta%'=='2' goto FCM
if '%scelta%'=='0' goto :ROM
goto :CMMENU

:FCM
cls
if Not Exist CM.zip goto :CMD
adb reboot recovery >nul
echo effettua i wipe (almeno system,data,cache e dalvik) e poi manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload CM.zip
echo rimanda il telefono in sideload.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OGAPPS.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
goto menu

:DCM
cls
if Not Exist CM.zip goto :CMD
adb reboot recovery >nul
echo Manda il telefono in sideload (avanzate - sideload)
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload CM.zip
echo fatto! ora riavvia, ci vorra' un po per il primo riavvio.
ping 127.0.0.1 -n 5 >nul
goto menu

:CMD
echo CM.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest http://download.cyanogenmod.org/get/jenkins/186540/cm-14.1-20161111-NIGHTLY-oneplus3.zip -outfile CM.zip
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :CM

:DECRIPT
echo.
echo LA FUNZIONE ARRIVERA' PRESTO!
ping 127.0.0.1 -n 8 >nul
goto menu

:EXIT
echo.
echo Ci vediamo!
echo Spengo il server adb.
adb kill-server
ping 127.0.0.1 -n 3 >nul
