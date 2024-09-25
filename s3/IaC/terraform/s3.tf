resource "aws_s3_bucket" "test-s3-bucket" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}