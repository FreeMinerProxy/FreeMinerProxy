@echo off
chcp 65001
REM 声明采用UTF-8编码
echo 正在安装，请稍后.........
:loop
	tasklist | find /i "tproxy.exe" && goto end || echo 安装中......
goto loop
:end
	echo 安装成功，请打开外网ip:28888，初始密码为123456
pause