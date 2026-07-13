@echo off
chcp 65001 >nul
title 闲鱼自动售卖机器人 - 7x24小时值守

:start
echo ========================================
echo   Xianyu Auto Agent - 闲鱼自动售卖机器人
echo   自动重启模式 - 关闭窗口即可停止
echo ========================================
echo.

cd /d "%~dp0"

REM 激活虚拟环境并运行
call venv\Scripts\activate.bat
echo 正在启动闲鱼机器人...
echo 如果机器人异常退出，将在5秒后自动重启...
echo.

python main.py

echo.
echo 机器人已停止，5秒后自动重启...
echo 若要完全关闭，请直接关闭此窗口。
echo.
timeout /t 5 /nobreak >nul
goto start
