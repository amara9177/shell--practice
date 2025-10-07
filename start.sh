#!/bin/bash

AMI_ID=ami-09c813fb71547fc4f
SG_ID=sg-052a01f1058647918

for instance in $@
do
    INSTANCE_ID=$(aws ec2 run-instances --image-id $AMI_ID --instance-type t3.micro --security-group-ids 
    $SG_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" --query 'Instances[0].InstanceId' --output text)

    #get private ip
    if [ $INSTANCE_ID !=frontend ];then
        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query  .Instances[*].PrivateIpAddress' --output text)
    else
        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query .Instances[*].PublicIpAddress' --output text)
    fi
done