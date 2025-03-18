# Automate docker build,tag & push with a single command
## Steps:
1. Intall run.sh, either git clone or copy paste, do whatever
2. in the directory where run.sh is installed run `chmod +x run.sh`
3. run `sudo mv run.sh /usr/local/bin/rundocker.sh`
- In the statement below the word post alias is modifiable, in case u want to custom set the alias u want, just replace the rundockerpush with the custom command u want to use
4. run `echo 'alias rundockerpush="/usr/local/bin/rundocker.sh"'>> ~/.bashrc`
5. run `source ~/.bashrc`
5. run `rundockerpush` or whatever u set as ur custom alias
6. input owner name and the script will take you to the next steps

