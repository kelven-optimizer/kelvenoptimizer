@echo off
title KelvenOS - Restore Original Settings
color 0B
echo ===============================================
echo    KELVENOS RESTORE ORIGINAL SETTINGS
echo ===============================================
echo.
echo [*] Restaurando configuracoes originais...

:: Restaurar Power Plan
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e

:: Reativar serviços
sc config "DiagTrack" start= auto
sc config "dmwappushservice" start= auto
sc config "WMPNetworkSvc" start= auto
sc config "WSearch" start= auto
sc config "SysMain" start= auto

:: Reativar telemetria
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /f 2>nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /f 2>nul

:: Reativar Windows Defender
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /f 2>nul

:: Restaurar configurações de rede
netsh int tcp set global chimney=disabled
netsh int tcp set global autotuninglevel=normal
netsh int ip reset

:: Restaurar Memory Compression
Enable-MMAgent -MemoryCompression 2>nul
if errorlevel 1 (
    reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableCompression" /f 2>nul
)

:: Restaurar SuperFetch
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /f 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "3" /f

:: Reativar Game DVR
reg delete "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /f 2>nul

:: Reativar atualizações
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /f 2>nul

echo [+] Todas as configuracoes restauradas!
echo [!] REINICIE para aplicar as mudancas.
pause