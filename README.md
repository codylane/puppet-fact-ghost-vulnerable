# puppet-fact-ghost-vulnerable
A facter ruby plugin to determine if RedHat based machines are affected by the GHOST gblic vulnerability.

# Background
See this link https://access.redhat.com/articles/1332213

# Supported OS Families
Currently supported OS families:
* RedHat

# Disclaimer
This code is intended to help you identify if your OS version of `glibc` is vulnerable.

It does not tell you if the the apps running in your environment have been
affected in anyway.  It may not bee 100% reliable, however, this ruby
implementation is based off the bash script written by RedHat.
http://www.cyberciti.biz/files/scripts/GHOST-test.sh.txt

# Report bugs
If you find a problem with this script, please submit a pull request.
