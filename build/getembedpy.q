0N!qhome:hsym`$$[not count u:getenv`QHOME;'"QHOME not defined";u];
dl:{[s;url]0N!$[s;;`/:]system 0N!"curl -u $GH_APIREAD -s -L ",url,$[s;" -J -O";""]}
download:{
 0N!assets:(0N!.j.k[dl[0b]"https://api.github.com/repos/KxSystems/embedPy/releases/",$[not[count x]|x~"latest";"latest";"tags/",x]])`assets;
 0N!relurl:first exec browser_download_url from assets where name like{"*",x,"*"}(`m64`l64`w64!string`osx`linux`windows).z.o;
 0N!$[count relurl;-1"downloading embedpy from ",relurl;'"release not found"];
 0N!(last` vs hsym`$relurl)1:dl[1b]relurl}
extract:{$[x like"*.tgz";"tar -zxf";x like"*.zip";$[.z.o~`w64;"7z e";"unzip"];'"not zip or tgz"]," ",string x}
install:{{(` sv qhome,x)1:read1 x}each`p.k`p.q,`$string[.z.o],"/p.so"}
getembedpy:{0N!install 0N!extract 0N!download 0N!x}
