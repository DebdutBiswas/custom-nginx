#set -v or set -x
tar --strip-components=1 -xvzf nginx-stable-1.12.1.tar.gz
tar -xvzf resources.tar.gz
cp res/nginx.rc src/os/win32/nginx.rc
cp res/nginx.ico src/os/win32/nginx.ico
mkdir objs
mkdir objs/src
mkdir objs/src/os
mkdir objs/src/os/win32
windres src/os/win32/nginx.rc objs/src/os/win32/ngx_rc.o
mkdir objs/lib
tar -xvzf pcre-8.40.tar.gz -C objs/lib
tar -xvzf zlib-1.2.11.tar.gz -C objs/lib
tar -xvzf openssl-1.0.2l.tar.gz -C objs/lib
mkdir objs/mods
tar -xvzf headers-more-nginx-module-0.32.tar.gz -C objs/mods
tar --strip-components=1 -xvzf patches.tar.gz
patch -p1 < nginx__1.13.0_http2_spdy.patch
cp openssl__chacha20_poly1305_draft_and_rfc_ossl102j.patch objs/lib/openssl-1.0.2l/openssl__chacha20_poly1305_draft_and_rfc_ossl102j.patch
cd objs/lib/openssl-1.0.2l
patch -p1 < openssl__chacha20_poly1305_draft_and_rfc_ossl102j.patch
./config
cd ../../..
auto/configure --with-cc=gcc --builddir=objs --with-debug --prefix= \
--conf-path=conf/nginx.conf --pid-path=logs/nginx.pid \
--http-log-path=logs/access.log --error-log-path=logs/error.log \
--sbin-path=nginx.exe --http-client-body-temp-path=temp/client_body_temp \
--http-proxy-temp-path=temp/proxy_temp \
--http-fastcgi-temp-path=temp/fastcgi_temp \
--http-scgi-temp-path=temp/scgi_temp \
--http-uwsgi-temp-path=temp/uwsgi_temp \
--with-cc-opt=-DFD_SETSIZE=1024 \
--with-pcre=objs/lib/pcre-8.40 \
--with-zlib=objs/lib/zlib-1.2.11 \
--with-openssl=objs/lib/openssl-1.0.2l \
--with-select_module \
--with-http_v2_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_stub_status_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_auth_request_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_slice_module \
--with-mail \
--with-stream \
--with-openssl-opt=no-asm \
--with-http_ssl_module \
--with-mail_ssl_module \
--with-stream_ssl_module \
--with-http_spdy_module \
--add-module=objs/mods/headers-more-nginx-module-0.32
sed -i '/\tobjs\/src\/os\/win32\/ngx_process_cycle.o \\/s/$/\n\tobjs\/src\/os\/win32\/ngx_rc.o \\/' objs/Makefile
make -f objs/Makefile
echo
echo 'Build Complete!'
cd objs
cp nginx.exe nginx_uncompressed.exe
echo
echo 'Print version info from compiled binary:'
nginx -V
echo 'Done!'
echo
echo 'Compressing compiled binary:'
upx nginx.exe --ultra-brute
echo 'Done!'
cd ..
echo
echo 'Exporting final package:'
mkdir compiled
cp objs/nginx.exe compiled/nginx.exe
cp objs/nginx_uncompressed.exe compiled/nginx_uncompressed.exe
tar -cvzf compiled.tar.gz compiled
rm compiled/*
rmdir compiled
echo 'Done!'
