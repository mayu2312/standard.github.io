@echo off
chcp 65001 >nul
title DISABLE WINDOWS UPDATE PERMANENT

echo ============================================
echo   DISABLE WINDOWS UPDATE PERMANENTLY
echo ============================================
echo.
echo [PERINGATAN]
echo Ini akan menonaktifkan Windows Update secara permanent!
echo Sistem tidak akan menerima security patches.
echo Gunakan dengan risiko sendiri!
echo.
set /p confirm="Lanjutkan? (Y/N): "
if /i not "%confirm%"=="Y" exit

echo.
echo [1] Menghentikan Windows Update Service...
net stop wuauserv 2>nul
net stop bits 2>nul
net stop dosvc 2>nul
net stop UsoSvc 2>nul

echo [2] Menonaktifkan service...
sc config wuauserv start= disabled
sc config bits start= disabled
sc config dosvc start= disabled
sc config UsoSvc start= disabled

echo [3] Menonaktifkan scheduled tasks...
schtasks /change /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /disable 2>nul
schtasks /change /tn "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /disable 2>nul
schtasks /change /tn "\Microsoft\Windows\UpdateOrchestrator\Reboot" /disable 2>nul

echo [4] Mengatur registry untuk disable update...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 1 /f

echo [5] Block update melalui firewall (opsional)...
netsh advfirewall firewall add rule name="Block_Windows_Update" dir=out action=block remoteport=80,443 protocol=TCP service=wuauserv 2>nul

echo.
echo [SUCCESS] Windows Update telah dinonaktifkan secara permanent!
echo.
echo Untuk mengaktifkan kembali, jalankan script enable_updates.bat
echo.
pause