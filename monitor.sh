#!/bin/bash

generate_section() {
	judul=$1
	cmd=$2
	echo "<h1>$judul</h1>"
	echo "<p>$(eval $cmd | sed -n '2p')</p>"
}

sections=(
	"Disk usage:df -h /"
	"Memory info:free -h"
)

        echo "<h1>Server Monitor</h1>" 
        echo "<h2>$(hostname)</h2>"
        echo "<p>$(date +%d-%m-%Y_%H-%M-%S)</p>"

for item in "${sections[@]}"; do
	judul=$( echo "$item" | cut -d':' -f1)
	cmd=$(echo "$item" | cut -d':' -f2)
	generate_section "$judul" "$cmd"
done

echo "Generate at $(date +%d-%m-%Y_%H-%M-%S)" >>/var/log/monitor.log 
