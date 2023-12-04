use io, form, @domchristie/turn, swipe-listener

parse_cookies

if [ "$x_server" = "true" ]; then
  x_server_nav="<li class=\"nav-item\" data-no-nav=\"1\"><button class=\"nav-link active text-start\" form=\"x-server\">Kill X Server</button></li>"
  export x_server_nav
fi
