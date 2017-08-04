# Custom Nginx for Windows
This is a custom Nginx version 1.12.1 for Windows NT platform.

# Features:
1) Added "http_headers-more" module for better http headers support.
2) Added "http_spdy" module for spdy support.
3) MinGW GCC compilation for native support of Windows NT sub-systems.
4) Added Cloudflare OpenSSL patch for "CHACHA20-POLY1305" support.
5) Added Cloudflare SPDY patch for simultaneous support of HTTP2 & SPDY.
6) All libraries and modules are embeded into the main binary.
7) UPX Ultra LZMA Compression is used to compress the binary to approx 30% of it's original size.

# Compilation Tools Required:
1) <a href="https://sourceforge.net/projects/mingw/files/latest/download?source=files">MinGW</a>
2) <a href="https://sourceforge.net/projects/mingw/files/MSYS/Base/msys-core/msys-1.0.11/MSYS-1.0.11.exe/download?use_mirror=excellmedia">MSYS</a>
3) <a href="https://upx.github.io/">Ultimate Packer for eXecutables</a>

--> Some Resources:
http://www.mingw.org/wiki/mingw
http://www.mingw.org/wiki/MSYS
http://nginx.org/
http://nginx.org/en/docs/howto_build_on_win32.html

Note: You need to install all MinGW features while installing MinGW in your system!

# Compilation:
--> Compilation script is already given!
--> Just extract downloaded repository to "C:\MinGW\msys\1.0\home\".
--> Next run "MSYS Shell", go to "C:\MinGW\msys\1.0\" and double click on msys.bat
--> Then go to the repository folder and you find a file named: "build.sh".
--> Run "build.sh" by hitting ./build.sh or build.sh on the MSYS Shell.

Note: This software is compiled using MinGW cross compiler toolsets for windows and some extra libraries like "perl", extra
build tools like "UPX Compressor" are used! Also some necessery libraries are included: PCRE, OpenSSL, Zlib.
