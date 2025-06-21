#!/bin/bash

current="1.1.22"
target="1.1.29"

find sql -type f -name "V*.sql" | while read file; do
  version=$(basename "$file" | sed -n 's/^V\([0-9.]\+\)__.*$/\1/p')

  if [[ "$(printf "%s\n" "$current" "$version" | sort -V | tail -n1)" == "$version" ]] && \
     [[ "$(printf "%s\n" "$target" "$version" | sort -V | head -n1)" == "$version" ]] && \
     [[ "$version" != "$current" ]]; then
    echo "$file"
  fi
done > filtered_files.txt
