use shttrdb, validator, accounts

parse_input

TITLE="Register"
export TITLE

. ${SHTTR_APP}/models/${CONTROLLER}
export MODEL_DATA

if [ "$REQUEST_METHOD" = "POST" ]; then
  if [ $validated -eq 1 ]; then
    register "${username}" "${password}" "/" &&\
    user_id=$(find_by username "$(url_string_decode ${username})" from users) &&\
    write_data ${user_id} full_name ${full_name} to users
  fi
fi

. ${SHTTR_APP}/views/${CONTROLLER}
