@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: 设置区域
:: ==========================================
set ENV_NAME=yolo_env
set PYTHON_VERSION=3.10
set REQ_FILE=../requirements.txt

echo [1/3] 正在检查 Conda 环境 "%ENV_NAME%"...

:: 检查环境是否已存在
call conda env list | findstr /C:"%ENV_NAME%" > nul
if %errorlevel% equ 0 (
    echo [!] 环境 "%ENV_NAME%" 已存在，跳过创建步骤。
) else (
    echo [+] 正在创建 Python %PYTHON_VERSION% 环境...
    call conda create -n %ENV_NAME% python=%PYTHON_VERSION% -y
)

:: ==========================================
:: 激活环境并安装依赖
:: ==========================================
echo [2/3] 正在激活环境并安装依赖项...

if exist %REQ_FILE% (
    :: 使用 call 确保脚本在激活环境后继续运行
    call conda activate %ENV_NAME% && pip install -r %REQ_FILE%
    if %errorlevel% equ 0 (
        echo [3/3] 依赖项安装成功！
    ) else (
        echo [X] 错误：安装依赖项时出错。
        pause
        exit /b %errorlevel%
    )
) else (
    echo [!] 未找到 %REQ_FILE%，跳过安装步骤。
)

echo ==========================================
echo 任务完成！环境 "%ENV_NAME%" 已就绪。
echo 使用 "conda activate %ENV_NAME%" 进入环境。
echo ==========================================
pause