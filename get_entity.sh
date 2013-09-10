#!/bin/bash
#Returns host entity from raxmon-entities-list
value="label=$(hostname)"
entity=""
while read -r line; do
   if [[ $line == *"$value "* ]]; then
      entity="${line:12:10}"
   fi
done < <(/usr/local/bin/raxmon-entities-list)

echo "$entity" > /home/entity_file.txt
