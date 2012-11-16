#!/bin/bash

# Script to process all separate sensor files into one big file
# Must be run from a parent directory of the sensor files (not too far up, as
# script will search all directories under tree)

# 0. Remove existing sensors_all.txt file, if it exists here.
rm sensors_all.txt
rm sensors_all_tmp.txt

# 1. Look for files within or under this directory starting with SM and ending 
# with txt, and combine all into a single file in pwd, listing the file name
# followed by a colon at the start of each line.
find . -type f -name SM\*txt -exec grep -H "" '{}' >> sensors_all_tmp.txt \;

# 2. Match everything from the start of the line through a t followed by a
# colon (indicating the end of the file name - note a colon alone doesn't work
# because colons appear in the time) and replace it with the three SMX
# characters pulled from the middle of the match followed by a tab character.
# THE CODE FOR THE SENSOR NUMBER MUST NOT APPEAR ANYWHERE IN THE FILE PATH.
sed 's/^.*\([SM0-9]\{3\}\).*t:/\1     /g' sensors_all_tmp.txt > sensors_all.txt

# 3. Remove temp file
rm sensors_all_tmp.txt
