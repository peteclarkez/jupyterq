:: Conda build
set OP=%PATH%
set PATH=C:\Miniconda3-x64;C:\Miniconda3-x64\Scripts;%PATH%
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86_amd64
:: install conda build requirements (use version < 3.12 to avoid warning about verify in output file)
conda install -y "conda-build<3.12"                                       || goto :error
conda install -y anaconda-client                                          || goto :error
:: set up kdb+ if available
if defined QLIC_KC ( echo|set /P=%QLIC_KC% > kc.lic.enc & certutil -decode kc.lic.enc kc.lic & set QLIC=%CD%)
conda build --output conda-recipe > packagenames.txt                      || goto :error
if defined QLIC_KC (
 conda build -c kx conda-recipe 
) else (
 conda build -c kx --no-test conda-recipe
)
set PATH=C:\Miniconda3-x64;C:\Miniconda3-x64\Scripts;%OP%
exit /b 0
:error 
echo ERROR
exit /b %errorLevel%

