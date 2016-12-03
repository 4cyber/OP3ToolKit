
@echo off
mode con:cols=80 lines=25
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
if Not Exist C:\adb goto :IADB
:PREMESSE
echo.
echo AVVIO ADB
echo.
adb start-server
start cmd.exe /C devices.bat
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
echo.
echo 1-Azioni Bootloader
echo 2-Flasha twrp / stock recovery
echo 3-Installa Supersu
echo 4-OxygenOS / Rom flash
echo 5-Decript (no wipe) [Coming soon]
echo 6-App Installer
echo 7-Aiuto
echo 0-Esci
echo.
set /p scelta= Scelta[0-7]:
if '%scelta%'=='1' goto :BOOT
if '%scelta%'=='2' goto :TWRP
if '%scelta%'=='3' goto :SUPERSU
if '%scelta%'=='4' goto :OOS
if '%scelta%'=='5' goto :DECRIPT
if '%scelta%'=='6' goto :APP
if '%scelta%'=='7' goto :HELP
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
set /p scelta= Scelta[2-0]:
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
goto menu

:moment
cls
echo Twrp non trovata, procedo al download!
echo.
powershell Invoke-Webrequest https://www.dropbox.com/s/yzo4eep6v9tv610/twrp-3.0.2-22-oneplus3.img?dl=1 -outfile twrp.img
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
echo hai gia installato la recovery? premi [s] per continuare, [n] per andare nel menu recovery o [m] per tornare nel menu
set /p scelta= Scelta:
if '%scelta%'=='n' goto :TWRP
if '%scelta%'=='m' goto :menu
if Not Exist supersu.zip powershell Invoke-Webrequest https://download.chainfire.eu/1014/SuperSU/SR5-SuperSU-v2.78-SR5-20161130091551.zip?retrieve_file=1 -outfile supersu.zip
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
echo 1-OxygenOS 3.2.8
echo 2-OxygenOS Community Build
echo 3-Rom [BETA]
echo 0-Torna al menu principale
echo.
set /p scelta= Scelta[3-0]:
if '%scelta%'=='1' goto FOOS
if '%scelta%'=='2' goto SCEOOSCB
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
del OOS.zip >nul
goto menu

:MOOS
echo OOS non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest https://www.dropbox.com/s/anhgdpvfcizypna/OnePlus3-OxygenOS-3.2.8-full.zip?dl=1 -outfile OOS.zip
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
echo 0-Torna al menu precedente
echo.
set /p scelta= Scelta[7-0]:
if '%scelta%'=='1' goto FOOSCB2
if '%scelta%'=='2' goto FOOSCB3
if '%scelta%'=='3' goto FOOSCB4
if '%scelta%'=='4' goto FOOSCB5
if '%scelta%'=='5' goto FOOSCB6
if '%scelta%'=='6' goto FOOSCB7
if '%scelta%'=='7' goto FOOSCB8
if '%scelta%'=='0' goto OOS
goto :SCEOOSCB

:FOOSCB2
cls
if Not Exist OOSCB2.zip goto MOOSCB2
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOSCB2.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
del OOSCB2.zip >nul
goto menu

:MOOSCB2
echo OOS CB 2 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_002_all_1608301010_6ee96e2225c34a71.zip -outfile OOSCB2.zip
goto FOOSCB2

:FOOSCB3
cls
if Not Exist OOSCB3.zip goto MOOSCB3
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOSCB3.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
del OOSCB3.zip >nul
goto menu

:MOOSCB3
echo OOS CB 3 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://s3.amazonaws.com/oxygenos.oneplus.net/OnePlus3Oxygen_16_OTA_003_all_1609142002_2a17363c90cd462e.zip -outfile OOSCB3.zip
goto FOOSCB3

:FOOSCB4
cls
if Not Exist OOSCB4.zip goto MOOSCB4
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOSCB4.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
del OOSCB4.zip >nul
goto menu

:MOOSCB4
echo OOS CB 4 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://s3.amazonaws.com/oxygenos.oneplus.net/OnePlus3Oxygen_16_OTA_004_all_1609281647_e6a1e7e2d11b4626.zip -outfile OOSCB4.zip
goto FOOSCB4

:FOOSCB5
cls
if Not Exist OOSCB5.zip goto MOOSCB5
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOSCB5.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
del OOSCB5.zip >nul
goto menu

:MOOSCB5
echo OOS CB 5 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_006_all_1610172123_2a54215ec1fa483e.zip -outfile OOSCB5.zip
goto FOOSCB5

:FOOSCB6
cls
if Not Exist OOSCB6.zip goto MOOSCB6
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOSCB6.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
del OOSCB6.zip >nul
goto menu

:MOOSCB6
echo OOS CB 6 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_007_all_1610310039_bc5bc09fd9af4ceb.zip -outfile OOSCB6.zip
goto FOOSCB6

:FOOSCB7
cls
if Not Exist OOSCB7.zip goto MOOSCB7
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOSCB7.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
del OOSCB7.zip >nul
goto menu

:MOOSCB7
echo OOS CB 7 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_009_all_1611161152_86fe98f7ebf24259.zip -outfile OOSCB7.zip
goto FOOSCB7

:FOOSCB8
cls
if Not Exist OOSCB8.zip goto MOOSCB8
echo il telefono si trova in recovery [s/n]?
set /p scelta= Scelta:
if '%scelta%'=='n' adb reboot recovery >nul
echo ricordati di fare i wipe prima di installare la oosCB almeno system, data, cache e dalvik)
ping 127.0.0.1 -n 8 >nul
echo vai in avanzate e poi in modalita' sideload.
echo.
echo premi un tasto quando sei in sideload.
pause >nul
adb sideload OOSCB8.zip
cls
echo Il primo avvio richiede un po' piu' di tempo, resisti.
ping 127.0.0.1 -n 8 >nul
del OOSCB8.zip >nul
goto menu

:MOOSCB8
echo OOS CB 8 non rilevata, download in corso, ci vorra' un po'... resisti!
echo.
powershell Invoke-Webrequest http://oxygenos.oneplus.net.s3.amazonaws.com/OnePlus3Oxygen_16_OTA_016_all_1611302306_cc5d2327b14247fd.zip -outfile OOSCB8.zip
goto FOOSCB8

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
echo 1-AICP (22-11-2016) (7.1)
echo 2-CyanogenMOD (25-11-2016) (7.1)
echo 3-FreedomOS () [coming soon]
echo 4-Apri il sito opengapps.org / scarica aroma
echo 0-Torna a Menu OOS
echo.
set /p scelta= Scelta[4-0]:
if '%scelta%'=='1' goto AICPMENU
if '%scelta%'=='2' goto CMMENU
if '%scelta%'=='3' goto FREEDOM
if '%scelta%'=='4' start http://opengapps.org/
if '%scelta%'=='0' goto :OOS
goto :ROM

:GAPPSAICP
cls
echo Verra' scaricato il pacchetto stock (670mb circa), se preferisci un pacchetto diverso scaricalo da "opengapps.org", rinominalo OGAPPS.zip e mettilo nella stessa directory del toolkit.
echo.
echo Se accetti il pacchetto Stock premi un tasto per il download automatico.
pause >nul
If Not Exist GAPPS.zip powershell Invoke-Webrequest https://www.dropbox.com/s/pwsh1478dghqsuk/open_gapps-arm64-7.1-stock-20161123.zip?dl=1 -outfile OGAPPS.zip
echo.
echo Fatto, attendi..
ping 127.0.0.1 -n 3 >nul
goto :FAICP

:GAPPSCM
cls
echo Verra' scaricato il pacchetto stock (670mb circa), se preferisci un pacchetto diverso scaricalo da "opengapps.org", rinominalo OGAPPS.zip e mettilo nella stessa directory del toolkit.
echo.
echo Se accetti il pacchetto Stock premi un tasto per il download automatico.
pause >nul
If Not Exist GAPPS.zip powershell Invoke-Webrequest https://www.dropbox.com/s/pwsh1478dghqsuk/open_gapps-arm64-7.1-stock-20161123.zip?dl=1 -outfile OGAPPS.zip
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
if Not Exist AICP.zip goto :AICPD
if Not Exist OGAPPS.zip goto :GAPPSAICP
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
del AICP.zip >nul
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
del AICP.zip >nul
goto menu

:AICPD
echo AICP.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest http://mirror2.aicp-rom.com/oneplus3/NIGHTLY/aicp_oneplus3_n-12.1-NIGHTLY-20161128.zip -outfile AICP.zip
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :AICPMENU

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
if Not Exist CM.zip goto :CMD
If Not Exist OGAPPS.zip goto :GAPPSCM
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
del CM.zip >nul
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
del CM.zip >nul
goto menu

:CMD
echo CM.zip non trovato, lo scarico per te... ci vorra un po'!
powershell.exe Invoke-Webrequest https://download.cyanogenmod.org/get/jenkins/187900/cm-14.1-20161202-NIGHTLY-oneplus3.zip -outfile CM.zip
echo fatto! comincio il processo di flash.
ping 127.0.0.1 -n 3 >nul
goto :CMMENU

:FREEDOM
echo.
echo COMING SOON!
ping 127.0.0.1 -n 3 >nul
goto :ROM

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
echo 3-Spotify (tablet mod v6.9.0.1212)
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
if Not Exist lucky.apk powershell Invoke-Webrequest https://www.dropbox.com/s/pc7931zdhuvreuu/Lucky%20Patcher%20v6.3.7.apk?dl=1 -outfile lucky.apk
adb install lucky.apk
echo.
del lucky.apk >nul
ping 127.0.0.1 -n 3 >nul
goto :APP

:ad
echo.
echo Attendi.
if Not Exist adaway.apk powershell Invoke-Webrequest https://www.dropbox.com/s/d8xwds6qftq846r/AdAway-release_Build-Nov.19.2016.apk?dl=1 -outfile adaway.apk
adb install adaway.apk
echo.
del adaway.apk >nul
ping 127.0.0.1 -n 3 >nul
goto :APP

:spotify
echo.
echo Attendi.
if Not Exist spotify.apk powershell Invoke-Webrequest https://www.dropbox.com/s/77sjpykjcbaqslt/Spotify%20Music%20v6.9.0.1212%20Final%20Mod%20iHackedit.com.apk?dl=1 -outfile spotify.apk
adb install spotify.apk
echo.
del spotify.apk >nul
ping 127.0.0.1 -n 3 >nul
goto :APP

:xposed
echo.
echo Attendi.
if Not Exist xposed.apk powershell Invoke-Webrequest https://www.dropbox.com/s/qcd36121qi4mlds/XposedInstaller_3.1.1.apk?dl=1 -outfile xposed.apk
adb install xposed.apk
echo.
del xposed.apk >nul
ping 127.0.0.1 -n 3 >nul
goto :APP

:HELP
cls
echo -La recovery TWRP non e' ufficiale, e' una versione modificata per funzionare con la ooscb.
echo.
echo -Questa versione della twrp sembra avere un bug, una volta finito il flash NON premete riavvia, andare nel menu principale, su reboot e poweroff, poi riaccendete normalmente.
echo.
echo -Potete scaricare ogni pacchetto manualmente, basta che abbia i nomi indicati per il toolkit (CM.zip, OGAPPS.zip, AICP.zip ecc)
echo.
echo -Molti dei pacchetti scaricati dal toolkit verranno eliminati alla fine del loro utilizzo, per rimuovere questa funzione rimuovete i [del "nomepacchetto"]
echo.
echo -I suggerimenti sono sempre ben accetti, specialmente se seguiti da un file batch con esempi.
echo.
echo 1-vai a changelog/in arrivo
echo 0-torna al menu principale
echo.
echo.
set /p scelta= Scelta[4-0]:
if '%scelta%'=='1' goto :CHANGE
if '%scelta%'=='0' goto :menu
goto :HELP

:CHANGE
cls
echo IN QUESTA VERSIONE (3-12-2016):
echo -aggiunti i numeri di scelta [n-n]
echo -aggiunta ogni versione (tranne la prima) della community build
echo -aggiornati i link
echo.
echo IN ARRIVO
echo -decript [molto lontano]
echo.
pause
goto :menu

:IADB
echo adb non sembra essere presente, vuoi installarlo [s/n]?:
set /p scelta= Scelta:
if '%scelta%'=='s' goto :INSTADB
goto :PREMESSE

:INSTADB
if Not Exist adb-setup-1.4.3.exe powershell.exe Invoke-Webrequest https://www.dropbox.com/s/duofwss02brdbpv/adb-setup-1.4.3.exe?dl=1 -outfile adb-setup-1.4.3.exe
start adb-setup-1.4.3.exe
if Not Exist OnePlus_USB_Drivers_Setup.exe powershell.exe Invoke-Webrequest https://www.dropbox.com/s/d9rn1iss7h5e1k1/OnePlus_USB_Drivers_Setup.exe?dl=1 -outfile OnePlus_USB_Drivers_Setup.exe
start OnePlus_USB_Drivers_Setup.exe
pause
start cmd.exe /C Toolkit.bat

:EXIT
echo.
echo Ci vediamo!
echo Spengo il server adb.
adb kill-server
ping 127.0.0.1 -n 3 >nul
