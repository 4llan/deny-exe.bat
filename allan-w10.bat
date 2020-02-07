c:
cd C:\WINDOWS\system32
takeown /f CompatTelRunner.exe
icacls CompatTelRunner.exe /grant Administradores:F
del /f CompatTelRunner.exe
del /f MRT.exe
REM pause