@echo off
set FILE_LIST=(%WINDIR%\system32\CompatTelRunner.exe %WINDIR%\system32\MRT.exe %WINDIR%\HelpPane.exe)
for %%f in %FILE_LIST% do (
	echo %%f
	if exist %%f (
		taskkill /f /im %%~nxf
		takeown /f %%f
		icacls %%f /deny *S-1-1-0:(X^)
		echo ^> blocked
		echo.
	)
)
REM pause