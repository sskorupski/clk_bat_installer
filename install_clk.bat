@echo off
setlocal enabledelayedexpansion

:: Check if Python is installed
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: Python is not installed.
    exit /b 1
)

:: Check Python version
for /f "tokens=2 delims=." %%v in ('python -V 2^>^&1') do (
    set python_version=%%v
)
if !python_version! lss 8 (
    echo Error: Python version 3.8 or higher is required.
    exit /b 1
)

:: Check if pip is installed
where pip >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: Pip is not installed.
    exit /b 1
)

:: Update pip
python -m pip install --upgrade pip
if %errorlevel% neq 0 (
    echo Error: Failed to update pip.
    exit /b 1
)

:: Install clk
pip install clk
if %errorlevel% neq 0 (
    echo Error: Failed to install clk.
    exit /b 1
)

:: Installe la complétion de clk pour le terminal Batch
python -m clk -L warning completion install batch
if %errorlevel% neq 0 (
    echo Erreur : Échec de l'installation de la complétion de clk pour le terminal Batch.
    exit /b 1
)

echo clk successfully installed! Enjoy!
