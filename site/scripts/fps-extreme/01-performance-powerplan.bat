@echo off
title KelvenOS - Power Plan Extreme
color 0A
echo ===============================================
echo    KELVENOS POWER PLAN EXTREME
echo ===============================================
echo.
echo [*] Criando plano de energia extremo...

:: Criar plano de energia extremo
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

:: Configurações extremas
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFINCPOL 1
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFDECPOL 1
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFINCTHRESHOLD 50
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFDECTHRESHOLD 20

:: Desativar economia de energia USB
powercfg -setacvalueindex SCHEME_CURRENT 2e601130-5351-4d9d-8e04-252966bad059 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0

:: Desativar economia de energia PCI Express
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0

echo [*] Configurando processador...
:: CPU Performance
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE 2
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTPOL 0
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR HETEROPOL 2

echo [*] Otimizando GPU...
:: High Performance GPU
powercfg -setacvalueindex SCHEME_CURRENT SUB_GRAPHICS GPUPREFERENCEPOL 2

echo [+] Power Plan Extreme configurado!
echo [!] Reinicie para aplicar todas as configuracoes.
pause