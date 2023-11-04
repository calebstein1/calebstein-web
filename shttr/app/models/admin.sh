if [ $signed_in ]; then
  full_name=$(signed_in_user full_name)
  export full_name
fi
