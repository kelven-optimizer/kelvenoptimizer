@echo off
title KelvenOS - NVIDIA Optimizer
color 0A
echo ===============================================
echo    KELVENOS NVIDIA OPTIMIZER
echo ===============================================
echo.
echo [*] Aplicando otimizacoes NVIDIA...

:: Configurações via nvidia-smi (se disponível)
nvidia-smi -pm 1 2>nul && echo [*] Modo de performance ativado
nvidia-smi -ac 7001,1860 2>nul && echo [*] OC de memoria aplicado

:: Configurações do Painel de Controle via registro
reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "NoPages" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "DisableOglMultiBuffering" /t REG_DWORD /d "1" /f

:: Shader Cache no máximo
reg add "HKCU\Software\NVIDIA Corporation\Global\NVControlPanel2\Client" /v "OptimusGlobalRenderingOffset" /t REG_DWORD /d "2" /f
reg add "HKCU\Software\NVIDIA Corporation\Global\NVControlPanel2\Client" /v "ShadercacheEnabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\NVIDIA Corporation\Global\NVControlPanel2\Client" /v "ShadercacheMaxSize" /t REG_DWORD /d "4294967295" /f

:: Preferência de Performance
reg add "HKCU\Software\NVIDIA Corporation\Global\NVControlPanel2\Client" /v "PreferredPerformanceMode" /t REG_DWORD /d "1" /f

:: Desativar Overlay
reg add "HKCU\Software\NVIDIA Corporation\NvContainer" /v "Startup" /t REG_DWORD /d "0" /f

echo [+] NVIDIA otimizada para gaming!
echo [!] Configure manualmente no Painel NVIDIA:
echo     1. Max Performance
echo     2. Low Latency Mode: Ultra
echo     3. Texture Filtering: High Performance
pause