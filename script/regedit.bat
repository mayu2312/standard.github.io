@echo off
reg add HKCU\Software\Microsoft\Office\16.0\Outlook\Search /v DisableServerAssistedSearch /t REG_DWORD /d 1