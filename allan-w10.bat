@echo off
setlocal
set FILE_LIST=%~dp0%~n0.txt
if exist %FILE_LIST% (
	for /f "delims=" %%f in (%FILE_LIST%) do (
		echo %%f
		if exist %%f (
			taskkill /f /im %%~nxf
			takeown /f %%f
			icacls %%f /deny *S-1-1-0:(X^)
			echo ^> blocked
			echo.
		)
	)
) else (
	echo "%FILE_LIST%" was not found
)
REM pause