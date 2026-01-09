@echo off
title KelvenOS - Memory Optimization
color 0D
echo ===============================================
echo    KELVENOS MEMORY OPTIMIZATION
echo ===============================================
echo.
echo [*] Otimizando memoria RAM...

:: Desativar Memory Compression
Disable-MMAgent -MemoryCompression 2>nul
if errorlevel 1 (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableCompression" /t REG_DWORD /d "1" /f
)

:: Otimizar Pagefile (SSD)
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=16384,MaximumSize=32768 2>nul

:: Clear Standby Memory
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndu" /v "Start" /t REG_DWORD /d "4" /f

:: Desativar SuperFetch para SSD
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f

:: Large Pages (para sistemas com 16GB+ RAM)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargePageMinimum" /t REG_DWORD /d "0xffffffff" /f

:: Disable Paging Executive
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f

echo [+] Memoria otimizada para gaming!
echo [!] Configure no BIOS: XMP/DOCP ativado
pause