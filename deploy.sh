#!/usr/bin/env bash

#sh deploy.sh --environment "testnet" --region "ap-southeast-1"  --key-pair "connext_testnet"


for arg in "$@"; do
    shift
        case "$arg" in
            "--environment") set -- "$@" "-e" ;;
            "--region") set -- "$@" "-r" ;;
            "--key-pair") set -- "$@" "-k" ;;
            *) set -- "$@" "$arg"
    esac
done

# Parse short options
while getopts "e:r:p:b:k:?" opt; do
    case "$opt" in
        "e")
            environment=$OPTARG
            ;;
        "r")
            region=$OPTARG
            ;;
        "k")
            key_pair=$OPTARG
            ;;
        "?")
            echo "Unknown option $opt"
            exit ;;
        *)
            # Should not occur
            echo "Unknown error while processing options"
            exit ;;
    esac
done

echo

if [[ -z "$environment" ]]; then
    environment="develop"
fi

if [[ -z "$region" ]]; then
    region="ap-southeast-1"
fi

if [[ -z "$key_pair" ]]; then
    key_pair="${environment}"
fi

stack_name="connext-${environment}"

aws cloudformation create-stack \
    --stack-name $stack_name \
    --template-body file://cloudformation.yaml \
    --region $region \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
        ParameterKey=EnvironmentName,ParameterValue=$environment \
        ParameterKey=KeyName,ParameterValue=$key_pair