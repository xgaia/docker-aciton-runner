#!/bin/bash

set -e

ORGANIZATION=$ORGANIZATION
ACTION_TOKEN=$ACTION_TOKEN
LABELS=$LABELS


cd /home/docker/actions-runner

labels_string=""
if [[ $LABELS ]];then
    labels_string="--labels $LABELS"
fi

./config.sh --url https://github.com/${ORGANIZATION} --token ${ACTION_TOKEN} ${labels_string}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${ACTION_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!

