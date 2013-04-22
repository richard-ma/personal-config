#!/usr/bin/env bash

readonly sourcefile=$1
readonly targetfile=$2

#######################################
# Main
rst2odt $sourcefile > temp.odt
libreoffice --headless --invisible --convert-to pdf:writer_pdf_Export temp.odt

exit 0
