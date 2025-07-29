echo "Please wait the installation..."

curl -L -O https://github.com/mayu2312/standard.github.io/raw/refs/heads/main/AnyDesk.exe --ssl-revoke-best-effort
AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --silent

curl -L -O https://github.com/mayu2312/standard.github.io/raw/refs/heads/main/UltraViewer_setup_6.6.113_en.exe --ssl-revoke-best-effort
UltraViewer_setup_6.6.113_en.exe /SILENT

curl -L -O https://github.com/mayu2312/standard.github.io/raw/refs/heads/main/ChromeSetup.exe --ssl-revoke-best-effort
ChromeSetup.exe /silent /install

curl -L -O https://github.com/mayu2312/standard.github.io/raw/refs/heads/main/winrar-x64-712.exe --ssl-revoke-best-effort
winrar-x64-712.exe /S

#curl -L -O https://raw.github.com/mayu2312/standard.github.io/main/startup.exe --ssl-revoke-best-effort
#startup.exe /silent

#curl -L -O https://raw.github.com/mayu2312/standard.github.io/main/eset_installer.exe --ssl-revoke-best-effort
#eset_installer.exe