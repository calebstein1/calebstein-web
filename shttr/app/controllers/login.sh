use shttrdb, accounts, validator, flash

parse_input
check_sign_in
read_flash

TITLE="Log In"
export TITLE
PAGE_ID=7
export PAGE_ID

. ${SHTTR_APP}/models/${CONTROLLER}

if [ $signed_in -eq 1 ]; then
  do_redirect to "/cgi-bin/admin.sh"
fi

if [ "$REQUEST_METHOD" = "POST" ]; then
  if [ "$_action" = "sign_in" ]; then
    sign_in "${username}" "${password}" "/cgi-bin/admin.sh" &&\
    set_notice "Signed in!"
  fi
fi

. ${SHTTR_APP}/views/${CONTROLLER}
