use esh

v shared/app.html
v shared/nav.html

echo '<div class="d-flex flex-column align-items-center container">'

if [ $signed_in -eq 1 ]; then
  vf index.html
  v nav.html
  if [ $p ]; then
    vf ${p}.html
  else
    vf software.html
  fi
  echo "</div>"
fi

if [ "$notice" ]; then
  v shared/flash.html
fi

v shared/btm.html
