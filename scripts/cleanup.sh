#!/bin/bash

# CodeDeploy 로그 및 임시 파일 경로
LOG_DIR="/opt/codedeploy-agent/deployment-root/deployment-logs"
DEPLOYMENTS_DIR="/opt/codedeploy-agent/deployment-root/deployment-group"

# CodeDeploy 이전 로그 삭제
if [ -d "$LOG_DIR" ]; then
  sudo rm -rf "$LOG_DIR"/*
fi

# CodeDeploy 이전 배포 디렉토리 삭제
if [ -d "$DEPLOYMENTS_DIR" ]; then
  sudo find "$DEPLOYMENTS_DIR" -maxdepth 1 -type d -mtime +7 -exec rm -rf {} \;
fi

echo "Cleanup completed."
