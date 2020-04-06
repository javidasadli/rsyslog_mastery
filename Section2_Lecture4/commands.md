# Send example message to remote syslog listener
echo "This is test message" > /dev/tcp/remoteip/514

# Submit a message to the local syslog daemon
logger -p daemon.info -t test "This is a test"

# Send an IETF syslog message over UDP
echo -n '<30>1 2020-04-15T05:20:00Z myhost test - - - testmsg' | nc -w 1 -u logserver 514

# Send the same message to remote BSD syslog server.
# echo -n 'string' outputs the string without trailing newline,
# nc -w 1 -u encapsulates lines from its standard input (including newlines)
# in UDP packets and sends them to the destination (-u), terminating if standard
# input has been idle for 1 second (-w 1)
echo -n '<30>March 20 04:20:00 myhost test: This is a test' | nc -w 1 -u logserver 

# Allowing 514 TCP port in firewall
firewall-cmd --zone=public --add-port=514/tcp --permanent
firewall-cmd --reload
