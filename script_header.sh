#!/bin/sh

# A script to add a header to other scripts and make them executable
# Joe Standring <jstandring@pm.me>
# GNU GPLv3

# Store current directory
DIR=${BASH_SOURCE%/}
if [[ ! -d "$DIR" ]]; then
    DIR="$PWD" 
fi  

# User inputs file location
read -e -p "File location (/path/to/script.sh): " FILE

# Removes spaces and converts captials to lower case
FILE=$(printf "$FILE" | tr -d "[:space:]" | tr "[:upper:]" "[:lower:]")

# Parameter expansion
FILE="${FILE/#\~/$HOME}"

# If the file already exists, inform the user and exit
if [ -e $FILE ]; then
    printf "This file already exists\n"
    exit
fi

# Record other information
read -p "Description: " DESC
read -p "Full name: " NAME
read -p "Email address: " EMAIL
read -p "License used: " LICENSE

# Ask if user wants to include a section listing dependencies
read -p "Do you want to include a dependencies section? (y/n): " DEPLIST

if [ "$DEPLIST" = "y" ]; then
    read -p "List dependencies seperated by a space: " DEPS
    DEPS=("\n\n# Dependencies: $(printf "$DEPS" | sed 's/ \{1,\}/, /g')")
fi

# Print script header to file
printf "#!/bin/sh\n\n# $DESC\n# $NAME <$EMAIL>\n# $LICENSE$DEPS\n\n\n" > $FILE

# Make file executable
chmod +x $FILE

# Ask if the user wants to open the file now
read -p "Do you want to open the file now? (y/n): " OPEN
OPEN=$(echo $OPEN | tr "[:upper:]" "[:lower:]")

if [ "$OPEN" = "y" ]; then
    vim +9 $FILE
fi

