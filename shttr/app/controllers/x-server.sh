use validator, form

TITLE="x-server"
export TITLE

if [ "$REQUEST_METHOD" = "POST" ]; then
  if [ "$_action" = "kill_x" ]; then
    printf "Set-Cookie: x_server=; Path=/; secure\n"
    do_redirect to "https://calebstein1.github.io/"
  fi
fi

. ${SHTTR_APP}/models/${CONTROLLER}

. ${SHTTR_APP}/views/${CONTROLLER}
