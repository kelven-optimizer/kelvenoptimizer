@echo off
title KelvenOS - CPU Performance Extreme
color 0C
echo ===============================================
echo    KELVENOS CPU PERFORMANCE EXTREME
echo ===============================================
echo.
echo [*] Otimizando CPU para gaming...

:: Desativar C-States (reduz latência)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Processor" /v "Capabilities" /t REG_DWORD /d "0x0007" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f

:: Prioridade de processos
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f

:: Desativar HPET
bcdedit /deletevalue useplatformclock
bcdedit /set disabledynamictick yes

:: Timer Resolution 0.5ms
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dxgkrnl" /v "TdrDelay" /t REG_DWORD /d "10" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dxgkrnl" /v "TdrDdiDelay" /t REG_DWORD /d "10" /f

:: Core Parking OFF
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPMINCORES 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPMAXCORES 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPMINCORES1 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPMAXCORES1 100

:: Desativar mitigação de segurança (Aviso: reduz segurança!)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f

echo [+] CPU otimizada para performance maxima!
echo [!] ALERTA: Mitigacoes de seguranca desativadas.
pause