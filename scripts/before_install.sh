#!/bin/bash
# before_install.sh 예시 스크립트

# 필요한 패키지 설치
sudo yum update -y

# 기존 파일 삭제
rm -rf /home/ec2-user/build/*
