use esh

v shared/app.html
v shared/nav.html
vf shared/x_server.html

echo '<div class="d-flex flex-column align-items-center container">'

v index.html

echo '<div class="d-flex flex-wrap gap-4"><ul class="list-group">'
collapse_id_num=1
for software_id in $software_id_list; do
  collapse_id="sw_${collapse_id_num}"
  code_link=""
  site_link=""
  name=$(software_${software_id} name)
  description=$(software_${software_id} description)
  code=$(software_${software_id} code)
  site=$(software_${software_id} site)
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
echo "</ul></div></div>"

v shared/btm.html
