# KelvenOS Performance Monitor
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host "    KELVENOS PERFORMANCE MONITOR" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

# Informações do Sistema
$os = Get-WmiObject Win32_OperatingSystem
$cpu = Get-WmiObject Win32_Processor
$gpu = Get-WmiObject Win32_VideoController
$ram = Get-WmiObject Win32_ComputerSystem

Write-Host "=== SYSTEM INFORMATION ===" -ForegroundColor Green
Write-Host "OS: $($os.Caption)"
Write-Host "CPU: $($cpu.Name)"
Write-Host "GPU: $($gpu.Name)"
Write-Host "RAM: $([math]::Round($ram.TotalPhysicalMemory/1GB)) GB"
Write-Host ""

# Status das Otimizações
Write-Host "=== OPTIMIZATION STATUS ===" -ForegroundColor Yellow

# Verificar Power Plan
$powerplan = powercfg /getactivescheme
if ($powerplan -like "*Ultimate Performance*" -or $powerplan -like "*High performance*") {
    Write-Host "Power Plan: OPTIMIZED ✓" -ForegroundColor Green
} else {
    Write-Host "Power Plan: NOT OPTIMIZED ✗" -ForegroundColor Red
}

# Verificar Game Mode
$gamemode = Get-ItemProperty "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -ErrorAction SilentlyContinue
if ($gamemode.AutoGameModeEnabled -eq 1) {
    Write-Host "Game Mode: ENABLED ✓" -ForegroundColor Green
} else {
    Write-Host "Game Mode: DISABLED ✗" -ForegroundColor Red
}

# Verificar Game DVR
$gamedvr = Get-ItemProperty "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -ErrorAction SilentlyContinue
if ($gamedvr.GameDVR_Enabled -eq 0) {
    Write-Host "Game DVR: DISABLED ✓" -ForegroundColor Green
} else {
    Write-Host "Game DVR: ENABLED ✗" -ForegroundColor Red
}

# Verificar telemetria
$telemetry = Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -ErrorAction SilentlyContinue
if ($telemetry.AllowTelemetry -eq 0) {
    Write-Host "Telemetry: DISABLED ✓" -ForegroundColor Green
} else {
    Write-Host "Telemetry: ENABLED ✗" -ForegroundColor Red
}

Write-Host ""
Write-Host "=== PERFORMANCE METRICS ===" -ForegroundColor Magenta

# Monitorar em tempo real (30 segundos)
$count = 0
while ($count -lt 30) {
    $cpuUsage = (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average
    $memUsage = (Get-WmiObject Win32_OperatingSystem).FreePhysicalMemory / 1MB
    $totalMem = $ram.TotalPhysicalMemory / 1GB
    $memPercent = [math]::Round(($totalMem - $memUsage) / $totalMem * 100, 1)
    
    Write-Host "CPU: $cpuUsage% | RAM: $memPercent% used | Free: $([math]::Round($memUsage,1))GB" -ForegroundColor White
    
    Start-Sleep -Seconds 1
    $count++
}

Write-Host ""
Write-Host "=== RECOMMENDATIONS ===" -ForegroundColor Cyan
Write-Host "1. Use KelvenOS Optimizer scripts for maximum FPS"
Write-Host "2. Keep drivers updated"
Write-Host "3. Monitor temperatures during gaming"
Write-Host "4. Use restore script if experiencing issues"
Write-Host ""
pause