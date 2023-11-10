use esh

v shared/app.html
v shared/nav.html

echo '<div class="d-flex flex-column align-items-center container">'

if [ $signed_in -eq 1 ]; then
  vf index.html
  v nav.html
  echo '<turbo-frame id="_admin">'
  if [ $p ]; then
    vf ${p}.html
  else
    vf software.html
  fi
  vf sign_out.html
  vf x_server.html
  echo "</turbo-frame>"
  echo "</div>"
fi

if [ "$notice" ]; then
  v shared/flash.html
fi

v shared/btm.html
