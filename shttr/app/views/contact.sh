use esh

v shared/app.html
v shared/nav.html
vf shared/x_server.html
vf index.html

if [ "$notice" ]; then
  v shared/flash.html
fi

v shared/btm.html
