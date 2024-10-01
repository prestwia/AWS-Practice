## Create bucket

```sh
aws s3 mb s3://encryption-example-ap-1234
```

## Create a file and put with SSE-S3

echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://encryption-example-ap-1234

## Put object with KMS encryption

```sh
aws s3api put-object \
--bucket encryption-example-ap-1234 \
--key hello.txt \
--body hello.txt \
--server-side-encription aws:kms
--ssekms-key-id [your-key]
```

## Download file

```sh
aws s3 cp s3://encryption-example-ap-1234/hello.txt
```

## Put object with SSE-C

```sh
openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://encryption-example-ap-1234/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

aws s3 cp s3://encryption-example-ap-1234/hello.txt hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key
```