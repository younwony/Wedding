#!/bin/bash

# Deploy Script
PROJECT_ROOT="/home/ec2-user/build/wedding-0.0.1-SNAPSHOT.war"
nohup java -jar $PROJECT_ROOT > /dev/null 2> /dev/null < /dev/null &