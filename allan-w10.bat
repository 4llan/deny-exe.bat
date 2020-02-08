@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set FILE_LIST=(CompatTelRunner.exe MRT.exe)
for %%f in %FILE_LIST% do (
	set EXE=%WINDIR%\system32\%%f
	echo !EXE!
	if exist !EXE! (
		takeown /f !EXE!
		icacls !EXE! /grant Administradores:F
		del /f !EXE!
		echo ^> deleted
		echo.
	)
)
REM pause