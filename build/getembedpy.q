qhome:hsym`$$[not count u:getenv`QHOME;'"QHOME not defined";u];
dl:{[s;url]$[s;;`/:]system"curl -u $GH_APIREAD -s -L ",url,$[s;" -J -O";""]}
download:{
 assets:.j.k[dl[0b]"https://api.github.com/repos/KxSystems/embedPy/releases/",$[not[count x]|x~"latest";"latest";"tags/",x]]`assets;
 relurl:first exec browser_download_url from assets where name like{"*",x,"*"}(`m64`l64`w64!string`osx`linux`windows).z.o;
 $[count relurl;-1"downloading embedpy from ",relurl;'"release not found"];
 dl[1b]relurl;last ` vs hsym`$relurl}
extract:{system$[x like"*.tgz";"tar -zxf";x like"*.zip";$[.z.o~`w64;"7z e";"unzip"];'"not zip or tgz"]," ",string x}
install:{{(` sv qhome,x)1:read1 x}each`p.k`p.q,`$string[.z.o],"/p.so"}
getembedpy:{@[x;y;{exit 1}]}{install extract download x}
