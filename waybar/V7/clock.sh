#!/usr/bin/env bash

time=$(date +"%I:%M %p")
date_str=$(date +"%A, %d/%m")

printf '{"text":"%s\\n%s"}\n' "$time" "$date_str"