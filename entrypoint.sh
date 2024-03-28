#!/bin/sh

if [ -z "$STARTUP" ]; then
  echo "No STARTUP environment variable specified. Running default command."
  command="java -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:CompileThreshold=100 -XX:+UnlockExperimentalVMOptions -XX:+UseCompressedOops -Xmx512m -Xms256m -jar runner.jar"
elif [ "$STARTUP" = "Wrapper" ]; then
  echo "Starting Wrapper application..."
  command="java -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:CompileThreshold=100 -XX:+UnlockExperimentalVMOptions -XX:+UseCompressedOops -Xmx512m -Xms256m -jar runner.jar --start-application=WRAPPER"
elif [ "$STARTUP" = "Manager" ]; then
  echo "Starting Manager application..."
  command="java -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:CompileThreshold=100 -XX:+UnlockExperimentalVMOptions -XX:+UseCompressedOops -Xmx512m -Xms256m -jar runner.jar --start-application=MANAGER"
else
  echo "Error: Unexpected value for STARTUP environment variable."
  exit 1
fi

# Run the command in a screen session
screen -S SimpleCloud $command

# Keep the container running
tail -f /dev/null
