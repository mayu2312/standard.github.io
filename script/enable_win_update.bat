@echo off
chcp 65001 >nul
title ENABLE WINDOWS UPDATE

echo Mengaktifkan kembali Windows Update...
echo.

sc config wuauserv start= auto
sc config bits start= auto
sc config dosvc start= auto
sc config UsoSvc start= auto

net start wuauserv
net start bits
net start dosvc

schtasks /change /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /enable 2>nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f 2>nul

echo Windows Update telah diaktifkan kembali!
pause