#!/bin/bash

# Script to start both host and remote applications

echo -e "\033[0;32mStarting Remote Application...\033[0m"
cd remote && npm run dev &
REMOTE_PID=$!

echo -e "\033[0;33mWaiting for remote application to start...\033[0m"
sleep 5

echo -e "\033[0;32mStarting Host Application...\033[0m"
cd ../host && npm run dev &
HOST_PID=$!

echo -e "\033[0;36mApplications started!\033[0m"
echo -e "\033[0;34mRemote App: http://localhost:5001\033[0m"
echo -e "\033[0;34mHost App: http://localhost:3000\033[0m"

# Wait for both processes
wait $REMOTE_PID
wait $HOST_PID