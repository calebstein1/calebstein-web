use esh

v shared/app.html
v shared/nav.html
vf shared/x_server.html

echo '<div class="container d-flex flex-column gap-4 p-4" data-turn-enter data-turn-exit>'
if [ "$p" ]; then
  read_id ${p} from blog_posts
  title="$(blog_posts_${p} title)"
  date="$(blog_posts_${p} created_at)"
  body="$(blog_posts_${p} body)"
  export title
  export date 
  export body 
  v post.html
else
  echo '<ul class="list-unstyled d-flex flex-column gap-4">'
    for blog_post_id in $blog_posts_id_list; do
      title="$(blog_posts_${blog_post_id} title)"
      echo "<li><a class=\"text-decoration-none\" id=\"blogLink\" href=\"?p=${blog_post_id}\">${title}</a></li>"
    done
  echo "</ul></div>"
fi

v shared/btm.html
