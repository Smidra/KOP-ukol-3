#!/bin/bash

# Nainstaluj inotify-tools
while inotifywait -e close_write "$1"; do
	pdfcsplain "$1";
  echo "------------------------------------------------"
done
