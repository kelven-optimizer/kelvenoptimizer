@echo off
title KelvenOS - Windows Debloat
color 0C
echo ===============================================
echo    KELVENOS WINDOWS DEBLOAT
echo ===============================================
echo.
echo [*] Removendo bloatware e otimizando sistema...

:: Desativar telemetria COMPLETAMENTE
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f

:: Desativar Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f

:: Desativar Windows Defender (APENAS PARA GAMING)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f

:: Desativar serviços desnecessários
sc config "DiagTrack" start= disabled
sc config "dmwappushservice" start= disabled
sc config "WMPNetworkSvc" start= disabled
sc config "WSearch" start= disabled
sc config "SysMain" start= disabled

:: Remover Windows Apps inúteis (lista básica)
echo [*] Removendo apps pre-instalados...
powershell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *BingFinance* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *BingNews* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *BingSports* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *BingWeather* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Office.OneNote* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *People* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *WindowsCommunicationsApps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *XboxApp* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *XboxGameOverlay* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *XboxGamingOverlay* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *XboxIdentityProvider* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *XboxSpeechToTextOverlay* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *YourPhone* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *ZuneMusic* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *ZuneVideo* | Remove-AppxPackage"

:: Desativar atualizações automáticas (RECOMENDADO PARA GAMING)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f

echo [+] Windows otimizado e limpo!
echo [!] ALERTA: Windows Defender desativado.
pause