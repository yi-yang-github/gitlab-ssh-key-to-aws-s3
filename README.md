# gitlab-ssh-key-to-aws-s3

## Purpose of this code
Ofter in times, we need to manage SSH key access for AWS EC2 instances.

The code here provide a way to read the current active users of a GitLab group, read their pub keys, then save them as an `authorized_keys` file and sync the file to AWS S3.

Note that when you start an AWS EC2 instance, you can add commands to the start up script "user data", to overwrite the `authorized_keys` file from a S3 location. Thus your new instances will automatically accessible for the people who have access to a certain GitLab group.

You can put this code to a cronjob to automate this process, or choose to do it manually.


## Inputs:

In ./config.sh:
```
GITLAB_SERVER = ...
GITLAB_GROUP = ...
GITLAB_MEMEBERS_API_URL = ...
AWS_S3_DEST = ...
```

In ./secrets/gitalb_token.sh:
```
GITLAB_TOKEN =...
```

# Output:

An `authorized_keys` file uploaded to the AWS_S3_DEST.

You'll have a local copy of the file `gitlab_authorized_keys` as well.
