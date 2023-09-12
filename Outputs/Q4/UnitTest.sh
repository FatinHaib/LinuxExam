#!/bin/bash

compile_and_run_cpp() {
    g++ "$1" -o Outputs/Q4/a.out 2> "$3"
    [[ $? -eq 0 ]] && ./Outputs/Q4/a.out $2 >> "$3"
}

compile_and_run_python() {
    python3 "$1" $2 >> "$3" 2>&1
}

compile_and_run_java() {
    javac "$1" 2> "$3"
    [[ $? -eq 0 ]] && java -cp "$(dirname $1)" "${1%.*}" $2 >> "$3"
}

src_folder=$1
csv_file=$2

while IFS=',' read -r code_file params log_file; do
    if [[ -f "$src_folder/$code_file" ]]; then
        output_file="Outputs/Q4/$log_file"
        extension="${code_file##*.}"
        
        case $extension in
            "cpp") compile_and_run_cpp "$src_folder/$code_file" "$params" "$output_file" ;;
            "py") compile_and_run_python "$src_folder/$code_file" "$params" "$output_file" ;;
            "java") compile_and_run_java "$src_folder/$code_file" "$params" "$output_file" ;;
        esac
    fi
done < "$csv_file"
