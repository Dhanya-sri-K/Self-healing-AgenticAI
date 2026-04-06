#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define Python executable path (Windows structure)
PYTHON_EXE="$SCRIPT_DIR/venv/Scripts/python.exe"

# Function to start an agent
start_agent() {
    local agent_name=$1
    local agent_file=$2
    local port=$3
    
    echo "Starting $agent_name (Port: $port)..."
    # Use the specific venv python executable
    "$PYTHON_EXE" "$SCRIPT_DIR/agents/$agent_file/main.py" &
    local pid=$!
    echo "✓ $agent_name started (PID: $pid)"
    echo "$agent_name:$pid" >> "$SCRIPT_DIR/.agents_pids"
}

# Clear previous PID file
> "$SCRIPT_DIR/.agents_pids"

echo "================================"
echo "Starting All Agents"
echo "================================"

# Start all agents
start_agent "MergedAgent" "merged_agent" 8001
sleep 2
start_agent "ModelAgent" "model_agent" 8003
sleep 2
start_agent "DecisionAgent" "decision_agent" 8004
sleep 2
start_agent "MonitoringAgent" "monitoring_agent" 8005
sleep 2
start_agent "HealingAgent" "healing_agent" 8006
sleep 2
start_agent "AGL_Mock" "agl_mock" 8007
sleep 2

echo "================================"
echo "All agents started!"
echo "Dashboard: http://localhost:3000"
echo "================================"

# Keep the script running to monitor background processes
wait
