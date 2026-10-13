
#!/bin/bash

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear

echo -e "${CYAN}========================================${NC}"
echo -e "${GREEN}         SYSTEM INFORMATION${NC}"
echo -e "${CYAN}========================================${NC}"

echo -e "${YELLOW}Hostname          :${NC} $(hostname)"
echo -e "${YELLOW}Operating System  :${NC} $(. /etc/os-release && echo "$PRETTY_NAME")"
echo -e "${YELLOW}Kernel Version    :${NC} $(uname -r)"
echo -e "${YELLOW}Architecture      :${NC} $(uname -m)"
echo -e "${YELLOW}Current User      :${NC} $(whoami)"
echo -e "${YELLOW}Shell             :${NC} $SHELL"
echo -e "${YELLOW}Date and Time     :${NC} $(date)"
echo -e "${YELLOW}Uptime            :${NC} $(uptime -p)"
echo -e "${YELLOW}Last Boot         :${NC} $(uptime -s)"

echo
echo -e "${CYAN}----------- CPU INFORMATION -----------${NC}"
echo "CPU Model         : $(grep -m1 'model name' /proc/cpuinfo | cut -d ':' -f2 | xargs)"
echo "CPU Cores         : $(nproc)"
echo "System Load       : $(uptime | awk -F'load average:' '{print $2}')"

echo
echo -e "${CYAN}----------- MEMORY INFORMATION --------${NC}"
free -h

echo
echo -e "${CYAN}----------- DISK INFORMATION ----------${NC}"
df -h / 

echo
echo -e "${CYAN}----------- NETWORK INFORMATION -------${NC}"
echo "IP Address        : $(hostname -I | awk '{print $1}')"

echo
echo -e "${CYAN}----------- USER INFORMATION ----------${NC}"
echo "Logged-in Users   : $(who | wc -l)"
who

echo -e "${CYAN}========================================${NC}"
echo -e "${GREEN}          END OF REPORT${NC}"
echo -e "${CYAN}========================================${NC}"

