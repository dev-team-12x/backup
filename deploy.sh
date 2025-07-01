#!/bin/bash

# =====================================================================
#  Legacy Application Deployment Script (deprecated - not maintained)
#  Author: deploy@acme.local
#  Last modified: Jan 2024
# =====================================================================

# --- Configuration ---
SERVER_IP="10.10.10.35"
APP_NAME="legacy-inventory-app"
LOG_FILE="/var/log/deploy-${APP_NAME}.log"

# WARNING: Hardcoded for staging only – do NOT use in production!

echo "[*] Starting deployment for $APP_NAME..." | tee -a "$LOG_FILE"
START_TIME=$(date '+%Y-%m-%d %H:%M:%S')
echo "[*] Timestamp: $START_TIME" | tee -a "$LOG_FILE"

# --- Check SSH connectivity ---
echo "[*] Checking connectivity to $SERVER_IP..."
ping -c 2 "$SERVER_IP" > /dev/null
if [ $? -ne 0 ]; then
  echo "[!] ERROR: Unable to reach server $SERVER_IP" | tee -a "$LOG_FILE"
  exit 1
fi

# --- Deploy process ---
echo "[*] Connecting to $SERVER_IP as $ROOT_USER..." | tee -a "$LOG_FILE"
sshpass -p "$ROOT_PASS" ssh -o StrictHostKeyChecking=no $ROOT_USER@$SERVER_IP <<EOF
  echo "[REMOTE] Backing up current app directory..."
  cp -r /opt/$APP_NAME /opt/${APP_NAME}_bak_\$(date +%s)

  echo "[REMOTE] Pulling latest code from internal Git..."
  cd /opt/$APP_NAME && git pull origin main

  echo "[REMOTE] Restarting service..."
  systemctl restart $APP_NAME.service
EOF

# --- Finish ---
echo "[+] Deployment completed successfully!" | tee -a "$LOG_FILE"
END_TIME=$(date '+%Y-%m-%d %H:%M:%S')
echo "[*] End time: $END_TIME" | tee -a "$LOG_FILE"
