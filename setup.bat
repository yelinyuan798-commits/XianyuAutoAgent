@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

title XianyuAutoAgent - һ������

echo ========================================
echo   �����Զ���������� - һ������ű�
echo ========================================
echo.

REM ��ȡ��ǰĿ¼
set BOT_DIR=%~dp0
cd /d "%BOT_DIR%"

echo [1/6] ���Python����...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ? δ��⵽Python�����Ȱ�װ Python 3.8+
    echo   ���ص�ַ: https://www.python.org/downloads/
    echo   ��װʱ�빴ѡ "Add Python to PATH"
    pause
    exit /b 1
)
for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PY_VER=%%i
echo   ? Python %PY_VER%
echo.

echo [2/6] �������⻷��...
if not exist "venv\Scripts\python.exe" (
    python -m venv venv
    if !errorlevel! neq 0 (
        echo ? ���⻷������ʧ��
        pause
        exit /b 1
    )
    echo   ? ���⻷���Ѵ���
) else (
    echo   ? ���⻷���Ѵ���
)
echo.

echo [3/6] ��װ����...
call venv\Scripts\activate.bat
pip install -r requirements.txt -q
if !errorlevel! neq 0 (
    echo ? ������װʧ��
    pause
    exit /b 1
)
echo   ? ������װ���
echo.

echo [4/6] ������ʾ���ļ�...
if not exist "prompts\classify_prompt.txt" (
    copy "prompts\classify_prompt_example.txt" "prompts\classify_prompt.txt" >nul
    echo   ? classify_prompt.txt �Ѵ���
)
if not exist "prompts\price_prompt.txt" (
    copy "prompts\price_prompt_example.txt" "prompts\price_prompt.txt" >nul
    echo   ? price_prompt.txt �Ѵ���
)
if not exist "prompts\tech_prompt.txt" (
    copy "prompts\tech_prompt_example.txt" "prompts\tech_prompt.txt" >nul
    echo   ? tech_prompt.txt �Ѵ���
)
if not exist "prompts\default_prompt.txt" (
    copy "prompts\default_prompt_example.txt" "prompts\default_prompt.txt" >nul
    echo   ? default_prompt.txt �Ѵ���
)
echo.

echo [5/6] ���û�������...
if not exist ".env" (
    copy ".env.example" ".env" >nul
    echo   ? .env �ļ��Ѵ�������༭��д API_KEY �� COOKIES_STR
    echo.
    echo   ��������������������������������������������������������������������������������������������������������������
    echo   ��  ��Ҫ�ֶ�������������:                              ��
    echo   ��  1. API_KEY - ȥ https://platform.deepseek.com ע�� ��
    echo   ��  2. COOKIES_STR - ��¼ goofish.com ��F12����Cookie  ��
    echo   ��                                                     ��
    echo   ��  �༭ .env �ļ�������������                       ��
    echo   ��������������������������������������������������������������������������������������������������������������
    echo.
) else (
    echo   ? .env �Ѵ���
)
echo.

echo [6/6] ����Զ���������...
if not exist "data\delivery_items.json" (
    echo   {"items":{}} > "data\delivery_items.json"
    echo   ? data\delivery_items.json �Ѵ���
) else (
    echo   ? data\delivery_items.json �Ѵ���
)
echo.

echo ========================================
echo   �������!
echo ========================================
echo.
echo  �����ʽ:
echo    ˫�� start_bot.bat ���������
echo.
echo  ��������(��ѡ):
echo    �Թ���Ա�������:
echo    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
echo        /v "XianyuBot" /t REG_SZ
echo        /d "wscript.exe //B \"%BOT_DIR%start_bot.vbs\"" /f
echo.
echo  �����Զ�����:
echo    �༭ data\delivery_items.json �����Ʒ
echo.
echo  ��������˳�...
pause >nul
