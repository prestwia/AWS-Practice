## Create user with no permissions

Create new user with no permissions and generate access keys
```sh
aws iam create-user \
--user-name sts-machine-user

aws iam create-access-key \
--user-name sts-machine-user \
--output table
```

Use generated keys to add to credentials file
Edit profile name to 'sts'
```sh
aws configure

open ~/.aws/credentials
```

Test who you are
```sh
aws get-caller-identity
aws sts get-caller-identity --profile sts
```

Make sure access is denied
```sh
aws s3 ls --profile sts
```

## Create a Role

```sh
chmod u+x bin/deploy
./bin/deploy
```

## Use new user credentials and assume role

```sh
aws iam put-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```

```sh
aws sts assume-role \
--role-arn arn:aws:iam::147997163901:role/sts-example-stack-StsRole-m5gZJKtoECNJ \
--role-session-name s3-sts-example \
--profile sts
```

```sh
aws sts get-caller-identity --profile assumed
```

```sh
aws s3 ls --profile assumed
```


## Cleanup

Teardown CloudFormation stack using AWS Console

```sh
aws iam delete-user-policy \
--user-name sts-machine-user \
--policy StsAssumePolicy

aws iam delete-access-key \
--access-key-id AKIASE5KRQF6YLEKO5U6 \
--user-name sts-machine-user 

aws iam delete-user \
--user-name sts-machine-user
```