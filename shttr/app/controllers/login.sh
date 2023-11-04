use io, shttrdb, accounts, validator, flash, form

parse_input
check_sign_in
read_flash

TITLE="Log In"
export TITLE

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
