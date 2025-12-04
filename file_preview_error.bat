@echo off

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d 1

set /p FILE_PATH="Masukkan path user yang ingin diubah: "

echo [INFO] Menjalankan Perintah Unblock-File...
powershell -Command "Unblock-File -Path C:\Users\'%FILE_PATH'\Downloads\.*pdf"
powershell -Command "Unblock-File -Path C:\Users\'%FILE_PATH'\Downloads\.*xlsx"

echo [INFO] Perintah Unblock sudah dijalankan!

taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul

start explorer.exe

echo File Explorer telah di-restart!
pause