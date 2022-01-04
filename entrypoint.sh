## Shell script to start ddclient
#!/bin/bash
# Make sure it logs
tail -F /var/log/entrypoint.log

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
