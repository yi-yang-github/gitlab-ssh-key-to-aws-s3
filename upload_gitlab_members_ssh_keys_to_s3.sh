#!/bin/bash
source secrets/gitlab_token.sh

source ./config.sh


MEMBERS=`curl --header "PRIVATE-TOKEN: $GITLAB_TOKEN" GITLAB_MEMEBERS_API_URL`

MEMBER_NAMES=$(echo $MEMBERS | ./parse_members_to_names.py)
echo $MEMBER_NAMES
rm -f ./gitlab_authorized_keys
touch ./gitlab_authorized_keys

for NAME in $MEMBER_NAMES;
do
    curl $GITLAB_SERVER/$NAME.keys >> ./gitlab_authorized_keys
    echo "" >> ./gitlab_authorized_keys
done

aws s3 cp ./gitlab_authorized_keys s3://docker-cluster/uat/authorized_keys2

