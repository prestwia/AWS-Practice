## Convert to json

yq -o json policy.yml > policy.json


## Create IAM Policy

```sh
aws iam create-policy \
--policy-name aws-test-policy \
--policy-document file://policy.json
```

## Attach policy to user

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::147997163901:policy/aws-test-policy \
--user-name aws-examples
```

## Deleting Policies

```sh
aws iam delete-policy-version \
--policy-arn [arn]\
--version-id vx
```