#!/bin/bash

aws cloudformation $ACTION \
    --region us-east-1 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=805495149875.dkr.ecr.us-east-1.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-9a4a99e0 \
    ParameterKey=Cluster,ParameterValue=default \
    ParameterKey=Listener,ParameterValue=arn:arn:aws:elasticloadbalancing:us-east-1:805495149875:listener/app/production-website/3d9cb6bfdd5d4de5/16871d016b579d3a
