
#!/bin/bash
# mipass.sh Sample Script to read users password.
# password storage
data=$(tempfile 2>/dev/null)

# trap it
trap "rm -f $data" 0 1 2 5 15

# get password
dialog --title "Password" \
--clear \
--passwordbox "Introduzca su password" 10 30 2> $data

ret=$?

# make decision
case $ret in
  0)
    echo "Password is $(cat $data)";;
  1)
    echo "Cancelar.";;
  255)
    [ -s $data ] &&  cat $data || echo "ESC pressed.";;
esac
Save and close the file. Run it as follows:

chmod +x mipass.sh
./mipass.sh
