use io, shttrdb

parse_input

TITLE="Blog"
export TITLE
PAGE_ID=5
export PAGE_ID

. ${SHTTR_APP}/models/${CONTROLLER}

. ${SHTTR_APP}/views/${CONTROLLER}
