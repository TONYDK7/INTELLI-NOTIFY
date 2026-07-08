@echo off
echo Cleaning up unnecessary files...

REM Remove Python cache files
echo Removing Python cache files...
if exist backend\src\__pycache__ rmdir /s /q backend\src\__pycache__
if exist backend\src\api\__pycache__ rmdir /s /q backend\src\api\__pycache__
if exist backend\src\config\__pycache__ rmdir /s /q backend\src\config\__pycache__
if exist backend\src\core\__pycache__ rmdir /s /q backend\src\core\__pycache__
if exist backend\src\models\__pycache__ rmdir /s /q backend\src\models\__pycache__
if exist backend\src\schemas\__pycache__ rmdir /s /q backend\src\schemas\__pycache__

REM Remove virtual environment (will be recreated by Docker)
echo Removing virtual environment...
if exist backend\venv rmdir /s /q backend\venv

REM Remove test cache
echo Removing test cache...
if exist backend\.pytest_cache rmdir /s /q backend\.pytest_cache
if exist backend\.hypothesis rmdir /s /q backend\.hypothesis
if exist backend\.coverage del /q backend\.coverage

REM Remove IDE folders
echo Removing IDE folders...
if exist .vscode rmdir /s /q .vscode
if exist .idea rmdir /s /q .idea

REM Remove log files
echo Removing log files...
if exist backend\logs rmdir /s /q backend\logs
del /s /q *.log 2>nul

REM Remove node_modules if needed (uncomment to use)
REM echo Removing node_modules...
REM if exist frontend\node_modules rmdir /s /q frontend\node_modules

echo.
echo Cleanup complete!
echo.
pause
