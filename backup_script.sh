#!/bin/bash

# command line arguments
DIRNAME=$1
COMP_ALGO=$2
OUT_FILE=$3

# choose tar flags and extension
if [[ $COMP_ALGO == "none" ]]
then
  FLAG="-cf"
  EXT=".tar"
elif [[ $COMP_ALGO == "gzip" ]]
then
  FLAG="-czf"
  EXT=".tar.gz"
else [[ $COMP_ALGO == "bzip" ]]
  FLAG="-cjf"
  EXT=".tar.bz2"
fi

# change to directory that has to be archived
cd $DIRNAME
# archive and then encrypt using password based encrpytion
(tar $FLAG - * | openssl enc -e -aes-256-cbc -salt -pbkdf2 -out "../$OUT_FILE$EXT" -k "devops") 1> /dev/null 2> ../error.log