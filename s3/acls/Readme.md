# ACL example operations

## Create new bucket

```sh
aws s3api create-bucket --bucket acl-example-987 --region us-west-1
```

## Turn off Block Public Access for ACLs

```sh
aws s3api put-public-access-block \
--bucket acl-example-987 \
--public-access-block-configuration "BlockPublicAcls-false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block --bucket acl-example-987
```

## Change Bucket Ownership

```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-987 \
--ownserhip-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for user with different AWS account

```sh
aws s3api put-bucket-acl \
--bucket acl-example-987 \
--access-control-policy file:///workspace/AWS-Practice/s3/acls/policy.json
```

## Access Bucket from another account

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-example-987
aws s3 ls s3://acl-example-987
```

## Cleanup

```sh
aws s3 rm s3://acl-example-987/bootcamp.txt
aws s3 rb s3://acl-example-987
```