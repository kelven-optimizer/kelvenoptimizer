@echo off
title KelvenOS - Network Gaming Optimization
color 0E
echo ===============================================
echo    KELVENOS NETWORK GAMING OPTIMIZATION
echo ===============================================
echo.
echo [*] Otimizando rede para gaming...

:: Otimizacoes TCP/IP
netsh int tcp set global chimney=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global ecncapability=enabled

:: Desativar QoS
netsh int tcp set global qos=enabled

:: Otimizar buffers
netsh int tcp set global initialRto=1000
netsh int tcp set global dca=enabled

:: Limpar DNS e resetar TCP/IP
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset

:: Desativar Nagle's Algorithm
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "1" /f

:: Gaming Mode no Windows
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f

echo [+] Rede otimizada para gaming!
echo [!] Ping reduzido e latencia minima.
pause