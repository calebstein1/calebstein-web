use esh

v shared/app.html
v shared/nav.html
vf shared/x_server.html

echo '<div class="d-flex flex-column align-items-center container">'

v index.html

cat <<EOF
<div id="galleries" class="carousel slide">
  <div class="carousel-inner">
EOF
for photo_id in $photography_id_list; do
  name=$(photography_${photo_id} name)
  cover_photo=$(photography_${photo_id} cover_photo)
  url=$(photography_${photo_id} url)
  export name
  export cover_photo
  export url
  if [ $photo_id -eq 1 ]; then
    v gallery-first.html
  else
    v gallery.html
  fi
done
echo "</div>"

v carousel-controls.html
v shared/btm.html
