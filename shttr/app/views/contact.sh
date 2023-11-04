use esh

v shared/app.html
v shared/nav.html
vf contact/index.html

if [ "$notice" ]; then
  v shared/flash.html
fi

v shared/btm.html
