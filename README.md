# I Should Remember That!
This bash function allows you to quickly save the last N number of lines of your bash history with an optional description to help yourself remember what the command(s) did.

By default, the function outputs to a file on your MacOS desktop called `isrt.txt`.

Usage:
- Add `source /path/to/isrt.sh` to your ~/.bash_profile (remember to either run `source ~/.bash_profile` or start a new terminal session after making changes to your bash_profile)
- Use `isrt` to save only the last ran command from your bash history
- Add the `-d` flag with a description to save a reminder of what the command(s) did.
- Add the `-s` flag with a number of previous steps to save.

Example:

`echo "0"`

`echo "1"`

`echo "2"`

`isrt -s 3 -d "make the computer talk"`

Example `isrt.txt`:
```
----Wed Mar 11 17:40:30 CDT 2020----
Description: make the computer talk
echo "0"
echo "1"
echo "2"
------------------------------------
```
