@echo off
set /p var_user=Masukkan username yang ingin digunakan:
net use \\192.168.91.9\data /user:virgo\%var_user%
start \\192.168.91.9\data