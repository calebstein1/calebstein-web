use esh

v shared/app.html
v shared/nav.html

echo '<div class="d-flex flex-column align-items-center container">'

v index.html

echo '<div class="d-flex flex-wrap gap-4">'
for software_id in $software_id_list; do
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
  v card.html
done
echo "</div></div>"

v hover.html

v shared/btm.html
