if "%APPVEYOR_REPO_TAG%"=="true" (
        call :version %APPVEYOR_REPO_TAG_NAME%
        7z a jupyterq_windows-%APPVEYOR_REPO_TAG_NAME%.zip jupyterq_*.q w64/jupyterq.dll install.bat kxpy kernelspec examples kdb+Notebooks.ipynb LICENSE README.md && appveyor PushArtifact jupyterq_windows-%APPVEYOR_REPO_TAG_NAME%.zip ) ELSE (
        call :version %APPVEYOR_REPO_BRANCH%-%APPVEYOR_REPO_COMMIT%
        7z a jupyterq_windows-%APPVEYOR_REPO_BRANCH%-%APPVEYOR_REPO_COMMIT%.zip jupyterq_*.q w64/jupyterq.dll install.bat kxpy kernelspec LICENSE README.md examples kdb+Notebooks.ipynb && appveyor PushArtifact jupyterq_windows-%APPVEYOR_REPO_BRANCH%-%APPVEYOR_REPO_COMMIT%.zip
)

exit /b 0
:version
	set PATH=C:\Perl;%PATH%
	perl -p -i.bak -e s/JUPYTERQVERSION/`%1/g jupyterq_kernel.q
