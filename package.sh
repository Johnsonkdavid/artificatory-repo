#!/bin/bash

yum install -y docker awscli
service docker start
service docker status
exit 0
