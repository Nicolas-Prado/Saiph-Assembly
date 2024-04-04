#!/bin/bash
#don't forget to make 'chmod +x dynamicproj.sh' to make the file executable

# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 -o <project_name>"
    exit 1
fi

# Parse command line arguments
while getopts ":o:" opt; do
  case $opt in
    o)
      project_name=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Create project directory
mkdir -p "$project_name"
cd "$project_name" || exit

# Create folders
mkdir bin build include src

# Create Makefile
cp ../Makefile.example Makefile

echo "Project structure created successfully!"