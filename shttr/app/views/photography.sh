use esh

v shared/app.html
v shared/nav.html

echo '<div class="d-flex flex-column align-items-center container">'

v photography/index.html

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
    v photography/gallery-first.html
  else
    v photography/gallery.html
  fi
done
cat <<EOF
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#galleries" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#galleries" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<script>
  window.addEventListener("turbo:load", () => {
    const galleries = document.querySelector('#galleries')

    const carousel = new bootstrap.Carousel(galleries, {
      touch: true
    });
  });
</script>
</div>
EOF

v shared/btm.html
