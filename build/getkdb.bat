curl -fsSOJL %W64%
mkdir q 
7z x w64.zip -oq
echo|set /P =%QLIC_KC% >q\kc.lic.enc
certutil -decode q\kc.lic.enc q\kc.lic
