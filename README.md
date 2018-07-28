# PHP Package Finder

You can use this command to find out which version of a PHP package the PHP applications on your server have installed.
This can be useful for finding outdated versions or applications that need patches for security purposes.

## Requirements

- Assumes Unix system.
- Preferably installed at a location within your PATH.
- Currently assumes location being `/usr/local/bin` for the php part of the script. If needed you can change that in `php-package-version.sh`

## Installation

We will assume you have updated `php-package-version.sh` already (if necessary) and we will also make the `.sh` redundant

### Without .sh extension

    mv php-package-version.sh php-package-version
    chmod +x php-package-version
    cp php-package-version* /usr/local/bin
    
### With .sh extension

    cp php-package-version* /usr/local/bin

## Usage

If not renamed

    . php-package-version.sh <directory-name> <package-name>

If renamed

    php-package-version <directory-name> <package-name>

## Example

**Find**

    php-package-version myapp swiftmailer/swiftmailer
    
**Output**

    /var/www/myapp swiftmailer/swiftmailer v6.0.2

## Internal workings

- Recursively searches current directory `.` for `directory-name`
- Find the first level `composer.lock` file.
- PHP script decodes `composer.lock` and finds package `package-name`
- Display full path to directory package and version separated by tabs.
