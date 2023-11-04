if [ "$REQUEST_METHOD" = "POST" ]; then
  validate $username for_presence &&\
  validate $password for_length greater_than 7 &&\
  validate $full_name for_presence &&\
  do_redirect || do_error
fi
