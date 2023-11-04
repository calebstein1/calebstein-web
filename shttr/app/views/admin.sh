use esh

v shared/app.html
v shared/nav.html

echo '<div class="d-flex flex-column align-items-center container">'

if [ $signed_in -eq 1 ]; then
  vf admin/index.html
  v admin/nav.html
  if [ $p ]; then
    vf admin/${p}.html
  else
    vf admin/software.html
  fi
  echo "</div>"
fi

if [ "$notice" ]; then
  v shared/flash.html
fi

v shared/btm.html
