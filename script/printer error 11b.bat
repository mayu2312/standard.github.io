@echo off
reg add HKLM\SYSTEM\CurrentControlSet\Control\Print /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0
net stop spooler
net start spooler