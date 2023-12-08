use mailer, validator, shttrdb, flash

parse_input
read_flash

TITLE="Contact Me"
export TITLE
PAGE_ID=6
export PAGE_ID

. ${SHTTR_APP}/models/${CONTROLLER}

if [ "$REQUEST_METHOD" = "POST" ]; then
  if [ $validated -eq 1 ]; then
    #mail_id=$(create_table_entry in emails_sent)
    #write_data ${mail_id} email ${email} to emails_sent
    #write_data ${mail_id} subject ${subject} to emails_sent
    #write_data ${mail_id} message ${message} to emails_sent
    #write_data ${mail_id} sent_on "$(date +%F)" to emails_sent
    #send_email "caleb@calebstein.net" "Message from ${email}: ${subject}" "${message}" &&\
    #set_notice "Message sent successfully!"
    do_error
  fi
fi

. ${SHTTR_APP}/views/${CONTROLLER}
