use esh, pd

v shared/app.html
v shared/nav.html
vf shared/x_server.html
v rocket.html

echo '<div class="container p-4 text-center" data-turn-enter data-turn-exit>'
  pd index.md
echo '</div>'

v notice.html
echo '</div>'
v shared/btm.html
