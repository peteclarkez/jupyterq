set QHOME=%PREFIX%\q
mkdir %QHOME%
build\compile.bat
install.bat
exit /b 0
:error
exit /b %errorlevel%

