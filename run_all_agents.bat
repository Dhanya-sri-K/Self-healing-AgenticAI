@echo off
set SCRIPT_DIR=%~dp0
set PYTHON_EXE=%SCRIPT_DIR%venv\Scripts\python.exe

echo ================================
echo Starting All Agents (Batch)
echo ================================

echo Starting MergedAgent...
start /B "MergedAgent" "%PYTHON_EXE%" "%SCRIPT_DIR%agents\merged_agent\main.py"
timeout /t 2 /nobreak >nul

echo Starting ModelAgent...
start /B "ModelAgent" "%PYTHON_EXE%" "%SCRIPT_DIR%agents\model_agent\main.py"
timeout /t 2 /nobreak >nul

echo Starting DecisionAgent...
start /B "DecisionAgent" "%PYTHON_EXE%" "%SCRIPT_DIR%agents\decision_agent\main.py"
timeout /t 2 /nobreak >nul

echo Starting MonitoringAgent...
start /B "MonitoringAgent" "%PYTHON_EXE%" "%SCRIPT_DIR%agents\monitoring_agent\main.py"
timeout /t 2 /nobreak >nul

echo Starting HealingAgent...
start /B "HealingAgent" "%PYTHON_EXE%" "%SCRIPT_DIR%agents\healing_agent\main.py"
timeout /t 2 /nobreak >nul

echo Starting AGL_Mock...
start /B "AGL_Mock" "%PYTHON_EXE%" "%SCRIPT_DIR%agents\agl_mock\main.py"
timeout /t 2 /nobreak >nul

echo ================================
echo All agents started!
echo Dashboard: http://localhost:3000
echo ================================
