if not defined QLIC (
 goto :nokdb
)
del C:\projects\jupyterq\q\w64\q.exe :: TODO remove debug
call tests\test.bat || goto :error
exit /b 0

:error
exit /b %errorLevel%

:nokdb
echo no kdb
exit /b 0
