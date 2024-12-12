nc localhost 25 <<EOF
EHLO localhost
MAIL FROM:$ID@lab.it.uc3m.es
RCPT TO:labro@lab.it.uc3m.es
DATA
From: $ID@lab.it.uc3m.es
TO: labro@lab.it.uc3m.es
Subject: =?UTF-8?B?wqFBc3VudG8gcGFyYSBlbCBleGFtZW4h?=

test email
.
EOF
