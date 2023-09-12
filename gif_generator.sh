#!/bin/bash

input_image=$1
reduction_percent=$2
rotation_degree=$3
num_images=$4
output_gif=$5

convert "$input_image" -resize "$reduction_percent%" Outputs/Q3/reduced_image.jpeg

for (( i=1; i<=$num_images; i++ )); do
    convert Outputs/Q3/reduced_image.jpeg -rotate $(($rotation_degree * $i)) "Outputs/Q3/rotated_$i.jpeg"
done

convert -delay 20 Outputs/Q3/rotated_*.jpeg "$output_gif"
