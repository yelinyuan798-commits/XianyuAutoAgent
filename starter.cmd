@echo off
chcp 65001 >nul
title �����Զ����������
setlocal enabledelayedexpansion

REM === �ȴ�ϵͳ��ȫ���� (Լ30��) ===
echo �ȴ�ϵͳ����...
ping -n 30 127.0.0.1 >nul

set TRY=1

:retry
cd /d "C:\Users\��Ϊ����\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent"

echo [%time%] ��%TRY%�γ������������...

start "" /MIN "C:\Users\��Ϊ����\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent\venv\Scripts\python.exe" "C:\Users\��Ϊ����\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent\main.py"

REM ��15���û��������
ping -n 10 127.0.0.1 >nul

tasklist /FI "IMAGENAME eq python.exe" 2>nul | findstr python >nul
if errorlevel 1 (
    set /a TRY+=1
    if !TRY! LEQ 3 (
        echo [%time%] ���ʧ�ܣ�10����!TRY!������...
        ping -n 10 127.0.0.1 >nul
        goto retry
    ) else (
        echo ========================================
        echo  ���ʧ�ܣ����ֶ����� start_bot.bat
        echo ========================================
        pause
        exit
    )
)
echo [%time%] �������������ɹ���
exit
