#!/bin/sh

# A script to add a header to other scripts and make them executable
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Check if arguments are passed to the script
if [ "$#" -eq 0 ]; then
    # User inputs file location
    read -r -p "File location (/path/to/script.sh): " FILE
else
    FILE="$1"
fi

# Removes spaces and converts captials to lower case
FILE=$(printf "$FILE" | tr -d "[:space:]" | tr "[:upper:]" "[:lower:]")

# If the file already exists, inform the user and exit
if [ -e "$FILE" ]; then
    printf "This file already exists\n"
    exit
fi

# Record other information
read -r -p "Description: " DESC
read -r -p "Full name: " NAME
read -r -p "Email address: " EMAIL
read -r -p "License used: " LICENSE

# Ask if user wants to include a section listing dependencies
read -r -p "Do you want to include a dependencies section? (y/n): " DEPLIST

if [ "$DEPLIST" = "y" ]; then
    read -r -p "List dependencies seperated by a space: " DEPS
fi

# Print script header to file
printf "#!/bin/sh\n\n# $DESC\n# $NAME <$EMAIL>\n# $LICENSE\n\n# Dependencies: $DEPS\n\n\n" > "$FILE"

# Make file executable
chmod +x "$FILE"

# Ask if the user wants to open the file now
read -r -p "Do you want to open the file now? (y/n): " OPEN
OPEN=$(echo "$OPEN" | tr "[:upper:]" "[:lower:]")

if [ "$OPEN" = "y" ]; then
    vim +9 "$FILE"
fi

