
#!/bin/bash
email () {
/usr/bin/sendmail -nv $EMAIL <<EOF
From: resume-site@darin.com
Subject: Memory Alert on Resume Site!

Resume site is at $1 percent! 
EOF
}

MEMORY_THRESHOLD=75;

check_memory() {
  memory_used=$(sar -r 1 1 | awk 'END{print $4}')
  memory_percent=$(printf  "%.0f\n" $memory_used)
  ((memory_percent > MEMORY_THRESHOLD)) && email $memory_percent
}

check_memory
