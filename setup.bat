@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

title XianyuAutoAgent - 一键部署

echo ========================================
echo   闲鱼自动售卖机器人 - 一键部署脚本
echo ========================================
echo.

REM 获取当前目录
set BOT_DIR=%~dp0
cd /d "%BOT_DIR%"

echo [1/6] 检测Python环境...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ? 未检测到Python，请先安装 Python 3.8+
    echo   下载地址: https://www.python.org/downloads/
    echo   安装时请勾选 "Add Python to PATH"
    pause
    exit /b 1
)
for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PY_VER=%%i
echo   ? Python %PY_VER%
echo.

echo [2/6] 创建虚拟环境...
if not exist "venv\Scripts\python.exe" (
    python -m venv venv
    if !errorlevel! neq 0 (
        echo ? 虚拟环境创建失败
        pause
        exit /b 1
    )
    echo   ? 虚拟环境已创建
) else (
    echo   ? 虚拟环境已存在
)
echo.

echo [3/6] 安装依赖...
call venv\Scripts\activate.bat
pip install -r requirements.txt -q
if !errorlevel! neq 0 (
    echo ? 依赖安装失败
    pause
    exit /b 1
)
echo   ? 依赖安装完成
echo.

echo [4/6] 配置提示词文件...
if not exist "prompts\classify_prompt.txt" (
    copy "prompts\classify_prompt_example.txt" "prompts\classify_prompt.txt" >nul
    echo   ? classify_prompt.txt 已创建
)
if not exist "prompts\price_prompt.txt" (
    copy "prompts\price_prompt_example.txt" "prompts\price_prompt.txt" >nul
    echo   ? price_prompt.txt 已创建
)
if not exist "prompts\tech_prompt.txt" (
    copy "prompts\tech_prompt_example.txt" "prompts\tech_prompt.txt" >nul
    echo   ? tech_prompt.txt 已创建
)
if not exist "prompts\default_prompt.txt" (
    copy "prompts\default_prompt_example.txt" "prompts\default_prompt.txt" >nul
    echo   ? default_prompt.txt 已创建
)
echo.

echo [5/6] 配置环境变量...
if not exist ".env" (
    copy ".env.example" ".env" >nul
    echo   ? .env 文件已创建，请编辑填写 API_KEY 和 COOKIES_STR
    echo.
    echo   ┌─────────────────────────────────────────────────────┐
    echo   │  需要手动配置以下两项:                              │
    echo   │  1. API_KEY - 去 https://platform.deepseek.com 注册 │
    echo   │  2. COOKIES_STR - 登录 goofish.com 后F12复制Cookie  │
    echo   │                                                     │
    echo   │  编辑 .env 文件填入后继续即可                       │
    echo   └─────────────────────────────────────────────────────┘
    echo.
) else (
    echo   ? .env 已存在
)
echo.

echo [6/6] 检查自动发货配置...
if not exist "data\delivery_items.json" (
    echo   {"items":{}} > "data\delivery_items.json"
    echo   ? data\delivery_items.json 已创建
) else (
    echo   ? data\delivery_items.json 已存在
)
echo.

echo ========================================
echo   部署完成!
echo ========================================
echo.
echo  启动方式:
echo    双击 start_bot.bat 启动机器人
echo.
echo  开机自启(可选):
echo    以管理员身份运行:
echo    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
echo        /v "XianyuBot" /t REG_SZ
echo        /d "wscript.exe //B \"%BOT_DIR%start_bot.vbs\"" /f
echo.
echo  配置自动发货:
echo    编辑 data\delivery_items.json 添加商品
echo.
echo  按任意键退出...
pause >nul
