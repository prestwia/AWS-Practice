## Create a bucket

```sh
aws s3api create-bucket --bucket cors-example2-ap-234 --region us-west-1
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-example2-ap-234 \
--public-access-block-configuration "BlockPublicAcls-true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy \
--bucket cors-example2-ap-234 \
--policy file://policy2.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website \
--bucket cors-example2-ap-234
--wesbite-configuration  file://website.json
```

## Upload our javascript file

```sh
aws s3 cp hello.js s3://cors-example2-ap-234
```

## Create API Gateway with mock response and test output

curl -X POST -H "Content-Type: application/json" {test-url}

## Set CORS on bucket

```sh
aws s3api put-bucket-cors \
--bucket cors-example2-ap-234 \
--cors-configuration file://cors.json
```

## Cleanup

```sh
aws s3 rm s3://cors-example2-ap-234/*
aws s3 rb s3://cors-example2-ap-234
```