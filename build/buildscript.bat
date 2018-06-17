echo compiling

build\compile.bat || goto :error

echo here

if not defined QLIC_KC (
 goto :nokdb
)

@echo OFF
build\getkdb.bat || goto :error
set PATH=C:\Miniconda3-x64;C:\Miniconda3-x64\Scripts;%PATH%
mkdir embedpy 
cd embedpy
echo getembedpy"latest" | q ..\build\getembedpy.q -q || goto :error
cd ..
echo p)print('embedpy runs') | q -q || goto :error
pip install -r requirements.txt || goto :error
install.bat || goto :error

:error
@echo ON
echo failed with error %errorLevel%
exit /b %errorLevel%

:nokdb
@echo ON
echo no kdb
exit /b 0