
#!/bin/bash
email () {
/usr/sbin/sendmail $EMAIL <<EOF
  From: resume-site@darin.com
  Subject: Memory Alert on Resume Site!

  Resume site has $1 MB free! 
EOF
}

MEMORY_THRESHOLD=180;

check_memory() {
  set $(free -m)
  memory=$(printf  "%.0f\n" $(echo "${13}"| tr -d 'GMBK'))
  ((memory < MEMORY_THRESHOLD)) && email $memory
}

check_memory
