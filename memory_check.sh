
#!/bin/bash
email () {
/usr/bin/sendmail -nv $EMAIL <<EOF
From: resume-site@darin.com
Subject: Memory Alert on Resume Site!

Resume site is at $1 MB! 
EOF
}

MEMORY_THRESHOLD=200;

check_memory() {
  set $(free -m)
  echo "${13}"
  memory=$(printf  "%.0f\n" $(echo "${13}"| tr -d 'GMBK'))
  ((memory > MEMORY_THRESHOLD)) && email $memory
}

check_memory
