@echo off
title KelvenOS - GPU Optimization
color 0B
echo ===============================================
echo    KELVENOS GPU OPTIMIZATION
echo ===============================================
echo.
echo [*] Aplicando otimizacoes de GPU...

:: Desativar Game DVR e Game Bar
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f

:: Otimizar GPU Scheduling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f

:: MSI Mode Universal
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\PCI\VEN_10DE&DEV_*" /v "MSISupported" /t REG_DWORD /d "1" /f 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\PCI\VEN_1002&DEV_*" /v "MSISupported" /t REG_DWORD /d "1" /f 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\PCI\VEN_8086&DEV_*" /v "MSISupported" /t REG_DWORD /d "1" /f 2>nul

:: Desativar Windows Update Driver
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f

:: High Performance em Graphics Settings
reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "HighPerformance=1" /f

echo [+] Otimizacoes de GPU aplicadas!
echo [!] Configure manualmente no painel da NVIDIA/AMD:
echo     1. Pre-rendered frames: 1
echo     2. Texture filtering: High Performance
echo     3. Power Management: Maximum Performance
pause