use validator

parse_input

TITLE="Caleb Stein's Site"
export TITLE
PAGE_ID=1
export PAGE_ID

if [ "$mode" = "x_server" ]; then
  printf "Set-Cookie: x_server=true; Path=/; secure\n"
  do_redirect to "/"
fi

. ${SHTTR_APP}/models/${CONTROLLER}

. ${SHTTR_APP}/views/${CONTROLLER}
