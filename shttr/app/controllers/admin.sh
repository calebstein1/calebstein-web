use shttrdb, accounts, validator, flash

parse_input
check_sign_in
read_flash

TITLE="Admin Panel"
export TITLE
PAGE_ID=6
export PAGE_ID

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
  elif [ "$_action" = "add_blog_post" ]; then
    if [ $signed_in -eq 1 ]; then
      blog_post_id=$(create_table_entry in blog_posts)
      write_data ${blog_post_id} title ${title} to blog_posts
      write_data ${blog_post_id} body ${body} to blog_posts
      write_data ${blog_post_id} created_at $(date -R | tr " " "+") to blog_posts
      set_notice "Posted successfully!"
      do_redirect
    fi
  elif [ "$_action" = "sign_out" ]; then
    sign_out "/cgi-bin/login.sh"
    set_notice "Signed out!"
  fi
fi

. ${SHTTR_APP}/models/${CONTROLLER}

. ${SHTTR_APP}/views/${CONTROLLER}
