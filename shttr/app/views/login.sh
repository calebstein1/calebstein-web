use esh

v shared/app.html
v shared/nav.html
vf shared/x_server.html

echo '<div class="d-flex flex-column align-items-center container">'

vf index.html

if [ "$notice" ]; then
  v shared/flash.html
fi

v shared/btm.html
