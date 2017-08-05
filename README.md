# Custom Nginx for Windows
<img align="left" src="https://raw.githubusercontent.com/DebdutBiswas/custom-nginx/master/docs/images/nginx.png" alt="Nginx Logo" title="Nginx"><img align="left" src="https://raw.githubusercontent.com/DebdutBiswas/custom-nginx/master/docs/images/love.png" alt="Love Logo" title="Loves"><img align="left" src="https://raw.githubusercontent.com/DebdutBiswas/custom-nginx/master/docs/images/windows.png" alt="Windows Logo" title="Windows">

This is a custom nginx distro for Windows NT platform.

[![Build status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/DebdutBiswas/custom-nginx/tree/master)
[![GitHub issues](https://img.shields.io/github/issues/DebdutBiswas/custom-nginx.svg)](https://github.com/DebdutBiswas/custom-nginx/issues)
[![GitHub forks](https://img.shields.io/github/forks/DebdutBiswas/custom-nginx.svg)](https://github.com/DebdutBiswas/custom-nginx/network)
[![GitHub stars](https://img.shields.io/github/stars/DebdutBiswas/custom-nginx.svg)](https://github.com/DebdutBiswas/custom-nginx/stargazers)
[![Github Releases](https://img.shields.io/badge/downloads-v1.12.1-brightgreen.svg)](https://github.com/DebdutBiswas/custom-nginx/releases)
[![GitHub license](https://img.shields.io/badge/license-GNU-blue.svg)](https://raw.githubusercontent.com/DebdutBiswas/custom-nginx/master/LICENSE)

# Features:
1) Added "http_headers-more" module for better http headers support.
2) Added "http_spdy" module for spdy support.
3) MinGW GCC compilation for native support of Windows NT sub-systems.
4) Added Cloudflare OpenSSL patch for "CHACHA20-POLY1305" support.
5) Added Cloudflare SPDY patch for simultaneous support of HTTP2 & SPDY.
6) All libraries and modules are embeded into the main binary.
7) UPX Ultra LZMA Compression is used to compress the binary to approx 22.79% of it's original size.

# Compilation Tools Required:
1) <a href="https://sourceforge.net/projects/mingw/files/latest/download?source=files" target="_blank">MinGW</a>
2) <a href="https://sourceforge.net/projects/mingw/files/MSYS/Base/msys-core/msys-1.0.11/MSYS-1.0.11.exe/download?use_mirror=excellmedia" target="_blank">MSYS</a>
3) <a href="https://upx.github.io/" target="_blank">Ultimate Packer for eXecutables</a>

--> Some Resources:
<br />
http://www.mingw.org/wiki/mingw
<br />
http://www.mingw.org/wiki/MSYS
<br />
http://nginx.org/en/docs/howto_build_on_win32.html
<br />

Note: You need to install all MinGW features while installing MinGW in your system!

# Compilation:
--> Compilation script is already given!<br />
--> Just extract downloaded repository to "C:\MinGW\msys\1.0\home\".<br />
--> Next run "MSYS Shell", go to "C:\MinGW\msys\1.0\" and double click on msys.bat<br />
--> Then go to the repository folder and you will find a file named: "build.sh".<br />
--> Run "build.sh" by hitting ./build.sh or build.sh on the MSYS Shell.<br />

Note: This software is compiled using MinGW cross compiler toolsets for windows and some extra libraries like "perl", extra
build tools like "UPX Compressor" are used! Also some necessery libraries are included: PCRE, OpenSSL, Zlib.

# Version Build Info:
RAW Output:
<br />
nginx version: nginx/1.12.1<br />
built by gcc 6.3.0 (MinGW.org GCC-6.3.0-1)<br />
built with OpenSSL 1.0.2l  25 May 2017<br />
TLS SNI support enabled<br />
configure arguments: --with-cc=gcc --builddir=objs --with-debug --prefix= --conf-path=conf/nginx.conf --pid-path=logs/nginx.pid --http-log-path=logs/access.log --error-log-path=logs/error.log --sbin-path=nginx.exe --http-client-body-temp-path=temp/client_body_temp --http-proxy-temp-path=temp/proxy_temp --http-fastcgi-temp-path=temp/fastcgi_temp --http-scgi-temp-path=temp/scgi_temp --http-uwsgi-temp-path=temp/uwsgi_temp --with-cc-opt=-DFD_SETSIZE=1024 --with-pcre=objs/lib/pcre-8.40 --with-zlib=objs/lib/zlib-1.2.11 --with-openssl=objs/lib/openssl-1.0.2l --with-select_module --with-http_v2_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_stub_status_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_random_index_module --with-http_secure_link_module --with-http_slice_module --with-mail --with-stream --with-openssl-opt=no-asm --with-http_ssl_module --with-mail_ssl_module --with-stream_ssl_module --with-http_spdy_module --add-module=objs/mods/headers-more-nginx-module-0.32
