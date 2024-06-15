#!/bin/bash

# 애플리케이션 실행할 WAR 파일 경로 설정
PROJECT_ROOT="/home/ec2-user/build"
WAR_FILE="$PROJECT_ROOT/build/libs/wedding-0.0.1-SNAPSHOT.war"

APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

# build 파일 복사
echo "$TIME_NOW > $WAR_FILE 파일 복사" >> $DEPLOY_LOG
cp $PROJECT_ROOT/build/libs/*.war $WAR_FILE

# war 파일 실행
echo "$TIME_NOW > $WAR_FILE 파일 실행" >> $DEPLOY_LOG
nohup java -jar $WAR_FILE > $APP_LOG 2> $ERROR_LOG &

CURRENT_PID=$(pgrep -f $WAR_FILE)
echo "$TIME_NOW > 실행된 프로세스 아이디 $CURRENT_PID 입니다." >> $DEPLOY_LOG
