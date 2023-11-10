use shttrdb, accounts, validator, flash, form

parse_input
check_sign_in
read_flash

TITLE="Admin Panel"
export TITLE

if [ $signed_in -ne 1 ]; then
  do_redirect to "/cgi-bin/login.sh"
fi

if [ "$REQUEST_METHOD" = "POST" ]; then
  if [ "$_action" = "add_software" ]; then
    if [ $signed_in -eq 1 ]; then
      software_id=$(create_table_entry in software)
      write_data $software_id name ${name} to software
      write_data $software_id description ${description} to software
      write_data $software_id code ${code} to software
      write_data $software_id site ${site} to software
      set_notice "Software added successfully!"
      do_redirect
    fi
  elif [ "$_action" = "add_photo" ]; then
    if [ $signed_in -eq 1 ]; then
      photo_id=$(create_table_entry in photography)
      write_data $photo_id name ${name} to photography 
      write_data $photo_id url ${url} to photography
      write_data $photo_id cover_photo ${cover_photo} to photography
      set_notice "Album added successfully!"
      do_redirect
    fi
  elif [ "$_action" = "sign_out" ]; then
    sign_out "/cgi-bin/login.sh"
    set_notice "Signed out!"
  fi
fi

. ${SHTTR_APP}/models/${CONTROLLER}

. ${SHTTR_APP}/views/${CONTROLLER}
