use esh

v shared/app.html
v shared/nav.html
vf shared/x_server.html

echo '<div class="d-flex flex-column align-items-center container">'

v index.html

echo '<div class="d-flex flex-wrap gap-4"><ul class="list-unstyled d-flex flex-column gap-4">'
collapse_id_num=1
for game_id in $games_id_list; do
  collapse_id="gm_${collapse_id_num}"
  code_link=""
  site_link=""
  name=$(games_${game_id} name)
  description=$(games_${game_id} description)
  code=$(games_${game_id} code)
  site=$(games_${game_id} site)
  if [ $code ]; then
    code_link="<a href=\"${code}\" target=\"_blank\">Code</a>"
    export code_link
  fi
  if [ $site ]; then
    site_link="<a href=\"${site}\" target=\"_blank\">Website</a>"
    export site_link
  fi
  export name
  export description
  export collapse_id
  v card.html
  collapse_id_num=$(( $collapse_id_num + 1 ))
done
echo "</ul></div></div></div>"

v shared/btm.html
