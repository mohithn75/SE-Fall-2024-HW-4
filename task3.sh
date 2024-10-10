#!/bin/bash

# Modify 2nd class passengers' gender labels to abbreviated form
awk -F, 'BEGIN {OFS = FS} 
NR == 1 {print; next} 
$3 == 2 {
    gsub(/female/, "F", $6)
    gsub(/male/, "M", $6)
}
{print}' titanic.csv > temp.csv && mv temp.csv titanic.csv

# Calculate the average age of 2nd class passengers who embarked at Southampton
awk -F, 'NR > 1 && $3 == 2 && $NF ~ /S/ {
    gsub(/"/, "", $7)
    gsub(/^[ \t]+|[ \t]+$/, "", $7)

    if ($7 ~ /^[0-9]+(\.[0-9]+)?$/) {
        total_age += $7; passenger_count++
    }
}
END {
    if (passenger_count > 0) 
        print "Average Age:", total_age/passenger_count
    else 
        print "No valid age data available"
}' titanic.csv
