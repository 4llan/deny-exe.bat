@echo off
setlocal
if "%~1" == "" (
	call :denyFileOrList "%~dp0%~n0.txt"
	goto :EOF
)

:denyFileOrList
if /I "%~x1" == ".txt" (
	call :loadList "%~1"
) else (
	call :denyFile "%~1"
)
pause
goto :EOF

:loadList
echo Loading from list: %1
if exist %1 (
	echo.
	for /f "delims=" %%f in ('type "%~1"') do (
		call :denyFile "%%~f"
	)
) else (
	echo ^> The file was not found
	echo.
)
goto :EOF

:denyFile
echo %1
if exist %1 (
	taskkill /f /im "%~nx1"
	takeown /f "%~1"
	call icacls "%~1" /deny *S-1-1-0:(X^)
	echo.
) else (
	echo ^> The file was not found
	echo.
)
goto :EOF
