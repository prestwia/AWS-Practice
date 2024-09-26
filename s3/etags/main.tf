terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}


resource "aws_s3_bucket" "default" {
}

resource "aws_s3_object" "object" {
  bucket = resource.aws_s3_bucket.default.id
  key    = "myfile.txt"
  source = "myfile.txt"

  etag = filemd5("myfile.txt")
}