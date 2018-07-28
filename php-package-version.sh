#!/usr/bin/env bash

# Replace location if needed
PHP_SCRIPT_FILE=/usr/local/bin/php-package-version-finder.php


# Display some help
if [ $1 = 'help' -o $1 = '--help' -o $1 = '-h' ]; then
    echo "";
    echo "You can use this command to find out which version of a PHP package the PHP applications on your server have installed."
    echo "This can be usefull for finding outdated versions or applications that need patches for security purposes."
    echo "";
    echo "Usage:";
    echo ". php-package-version.sh <directory-name> <package-name>";
    echo "";
    echo "Internal workings:"
    echo "- Recursively searches for <directory-name>."
    echo "- Find the first level composer.lock file."
    echo "- Decode composer.lock and find package <package-name>";
    echo "- Display full path to directory package and version separated by tabs.";
    echo "";
    return
fi


#Actual command
find . -type d -name "$1" | xargs -I {} find {} -maxdepth 1 -type f -name "composer.lock" | xargs -I {} php $PHP_SCRIPT_FILE {} $2