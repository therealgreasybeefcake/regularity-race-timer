#!/bin/bash

# Navigate to the script's directory
cd "$(dirname "$0")"

# Kill any existing server on port 8000
lsof -ti:8000 | xargs kill -9 2>/dev/null

# Start the server
echo "Starting Blind Freddy Race Timer..."
echo "Opening Safari..."

# Start server in background
python3 -m http.server 8000 &
SERVER_PID=$!

# Wait for server to start
sleep 1

# Open Safari to localhost
open -a Safari http://localhost:8000

echo ""
echo "✓ Server running on http://localhost:8000"
echo "✓ Blind Freddy Race Timer opened"
echo ""
echo "Press Ctrl+C to stop the server"

# Wait for Ctrl+C
trap "kill $SERVER_PID 2>/dev/null; echo ''; echo 'Server stopped.'; exit" INT
wait $SERVER_PID
