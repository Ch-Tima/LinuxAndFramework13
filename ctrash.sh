#! /bin/bash
PT="/home/$(whoami)/.local/share/Trash/files/"
ls -l $PT | awk '{nf=""; for(i=9; i<=NF; i++) nf=nf $i " ";} {print $6, $5, nf}' | sort -rn | while read -r date size name; do if [ -n "$name" ]; then echo "delete -> $name"; sudo rm -r "$PT$name"; fi; done;
