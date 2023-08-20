**Solution for SGA-1**

How to run

`sh backup_script.sh INPUT_DIR COMPRESSION_ALGO OUTPUT_FILENAME`

use following command to decrypt and unarchive

`openssl enc -d -aes256 -pbkdf2 -in ARCHIVE.tar.gz | tar xz -C DIRECTORY_WHERE_UNARCHIVE`

password used is "devops" which can be changed in line-25 (-k flag) in script _backup_script.sh_