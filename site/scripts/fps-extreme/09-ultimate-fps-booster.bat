@echo off
title KelvenOS - ULTIMATE FPS BOOSTER
color 0E
echo ===============================================
echo    KELVENOS ULTIMATE FPS BOOSTER
echo ===============================================
echo.
echo [!!!] ATENCAO: Este script aplica TODAS as otimizacoes!
echo [!!!] Recomendado apenas para PCs dedicados a gaming.
echo.
pause

echo [1/9] Power Plan Extreme...
call "%~dp0\01-performance-powerplan.bat"

echo [2/9] CPU Performance...
call "%~dp0\02-cpu-performance.bat"

echo [3/9] GPU Optimization...
call "%~dp0\03-gpu-optimization.bat"

echo [4/9] Memory Optimization...
call "%~dp0\04-memory-optimization.bat"

echo [5/9] Network Gaming...
call "%~dp0\05-network-gaming.bat"

echo [6/9] Windows Debloat...
call "%~dp0\06-windows-debloat.bat"

echo [7/9] NVIDIA Optimization...
call "%~dp0\07-nvidia-optimizer.bat"

echo [8/9] AMD Optimization...
call "%~dp0\08-amd-optimizer.bat"

echo [9/9] Finalizando...
echo.
echo ===============================================
echo    OTIMIZACAO COMPLETA!
echo ===============================================
echo.
echo [!] REINICIE O COMPUTADOR
echo [!] Configure BIOS: XMP ativado, CPU em performance
echo [!] Verifique se o monitor esta na Hz maxima
echo.
echo Ganhos esperados:
echo   - 10-30% mais FPS em jogos
echo   - Latencia reduzida
echo   - Stuttering eliminado
echo   - Input lag minimo
pause