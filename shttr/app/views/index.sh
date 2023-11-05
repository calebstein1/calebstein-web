use esh, pd

v shared/app.html
v shared/nav.html
v rocket.html

echo '<div class="d-flex flex-column align-items-center">'
  echo '<div class="container p-4 text-center" data-turn-enter data-turn-exit>'
    pd index.md
  echo '</div>'
echo '</div>'

v shared/btm.html
