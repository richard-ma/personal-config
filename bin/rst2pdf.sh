#!/usr/bin/env bash

readonly sourcefile=$1

#######################################
# Main

name=$(ls $sourcefile | cut -d. -f1)

rst2odt.py $sourcefile > $name.odt
libreoffice --headless --invisible --convert-to pdf:writer_pdf_Export $name.odt
rm $name.odt

exit 0
