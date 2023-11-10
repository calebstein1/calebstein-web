use io, form, @domchristie/turn, three

parse_cookies

if [ "$x_server" = "true" ]; then
  x_server_nav="<li class=\"nav-item\"><button class=\"nav-link active\" form=\"x-server\">Kill X Server</button></li>"
  export x_server_nav
fi
