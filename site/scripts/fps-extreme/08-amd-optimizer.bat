@echo off
title KelvenOS - AMD Optimizer
color 0C
echo ===============================================
echo    KELVENOS AMD OPTIMIZER
echo ===============================================
echo.
echo [*] Aplicando otimizacoes AMD...

:: Configurações via registro para AMD
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableUlps" /t REG_DWORD /d "1" /f 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f 2>nul

:: Desativar PowerPlay
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_PhmSoftPowerPlayTable" /t REG_BINARY /d "00" /f 2>nul

:: Otimizar shader cache
reg add "HKCU\Software\AMD\Dx12" /v "ShaderCache" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\AMD\Dx12" /v "ShaderCacheSize" /t REG_DWORD /d "4096" /f

:: Configuração de performance
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableInternalLargePage" /t REG_DWORD /d "2" /f 2>nul

echo [+] AMD otimizada para gaming!
echo [!] Configure manualmente no Radeon Software:
echo     1. GPU Scaling: Off
echo     2. Wait for Vsync: Off
echo     3. Chill: Off
echo     4. Boost: On
pause