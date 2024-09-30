## Create new bucket

```sh
aws s3api create-bucket --bucket bucket-policy-example-987 --region us-west-1
```

## Create bucket policy

```sh
aws s3api put-bucket-policy --bucket bucket-policy-example-987 --policy file://policy.json
```

## In other account access bucket

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-example-987
aws s3 ls s3://bucket-policy-example-987
```

## Cleanup

```sh
aws s3 rm s3://bucket-policy-example-987/bootcamp.txt
aws s3 rb s3://bucket-policy-example-987
```