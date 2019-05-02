# Script Header
A script to add a header to other scripts and make them executable
## Installation
1. Clone the repository:
```sh
$ git clone https://github.com/joestandring/script-header/
```
2. Enter the directory
```sh
$ cd script-header
```
3. Allow running of the script
```sh
$ chmod +x script_header.sh
```
4. Optionally add it to a directory in the PATH like:
```sh
$ sudo cp script_header.sh /bin/
```
5. Run the script
```sh
$ ./script_header.sh
```
## How to use
Input the the location of the file, a descrition, your full name, your e-mail address, and a license.
it will be formatted in the file like this:
```sh
#!/bin/sh

# An awesome description!
# John Smith <johnsmith@example.com>
# GNU GPLv3

```
You will then be given the option to immediatley open the file in vim by inputting "y"
