#!/bin/bash


aws_version=`aws --version | cut  -d "." -f 1`

docker_version=`docker --version | cut  -d "." -f 1`

if [[ "$aws_version" == 'aws-cli/2' ]]; then
        echo "aws-cli V2 is installed"
else
        # Installing aws-cliv2
        cd /opt && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip -q awscliv2.zip && sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
fi

if [[ "$docker_version" == 'Docker version 19' ]]; then
        echo "docker is installed"
else
        # Installing docker
        yum install -y docker && service docker start

fi

# Making deployment directories

mkdir -p /root/docker-app && cd /root/docker-app

# Logging into AWC ECR for fetching the latest image

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 974834890433.dkr.ecr.us-east-1.amazonaws.com


# Pulling the latest image from ECR

docker pull 974834890433.dkr.ecr.us-east-1.amazonaws.com/demo:latest

container_id=`docker ps -a |  grep test-app | awk '{print $1}'`

echo $container_id

docker run -d -P  --name test-app-`echo $$` 974834890433.dkr.ecr.us-east-1.amazonaws.com/demo:latest

for x in $container_id
do
        docker stop $x && docker rm $x
done

exit 0




