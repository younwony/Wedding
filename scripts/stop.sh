#!/bin/bash

# 애플리케이션 실행할 WAR 파일 경로 설정
PROJECT_ROOT="/home/ec2-user/build"
WAR_FILE="$PROJECT_ROOT/build/libs/wedding-0.0.1-SNAPSHOT.war"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# 현재 구동 중인 애플리케이션 pid 확인
CURRENT_PID=$(pgrep -f $WAR_FILE)

# 프로세스가 켜져 있으면 종료
if [ -z "$CURRENT_PID" ]; then
  echo "$TIME_NOW > 현재 실행중인 애플리케이션이 없습니다" >> $DEPLOY_LOG
else
  echo "$TIME_NOW > 실행중인 $CURRENT_PID 애플리케이션 종료 " >> $DEPLOY_LOG
  kill -15 $CURRENT_PID
  echo "$TIME_NOW > $CURRENT_PID 프로세스가 종료되었습니다." >> $DEPLOY_LOG
fi
