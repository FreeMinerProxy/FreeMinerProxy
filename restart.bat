@echo off
chcp 65001
REM 声明采用UTF-8编码
:loop
	tasklist | find /i "tproxy.exe" && goto end || echo “启动中...”
goto loop
:end
	echo 启动成功
pause