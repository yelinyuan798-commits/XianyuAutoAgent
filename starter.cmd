@echo off
chcp 65001 >nul
title 闲鱼自动售卖机器人
setlocal enabledelayedexpansion

REM === 等待系统完全就绪 (约30秒) ===
echo 等待系统就绪...
ping -n 30 127.0.0.1 >nul

set TRY=1

:retry
cd /d "C:\Users\但为君故\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent"

echo [%time%] 第%TRY%次尝试启动机器人...

start "" /MIN "C:\Users\但为君故\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent\venv\Scripts\python.exe" "C:\Users\但为君故\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent\main.py"

REM 等15秒让机器人启动
ping -n 10 127.0.0.1 >nul

tasklist /FI "IMAGENAME eq python.exe" 2>nul | findstr python >nul
if errorlevel 1 (
    set /a TRY+=1
    if !TRY! LEQ 3 (
        echo [%time%] 启动失败，10秒后第!TRY!次重试...
        ping -n 10 127.0.0.1 >nul
        goto retry
    ) else (
        echo ========================================
        echo  启动失败！请手动运行 start_bot.bat
        echo ========================================
        pause
        exit
    )
)
echo [%time%] 闲鱼机器人启动成功！
exit
