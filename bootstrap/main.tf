provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "ecs-s3" {
    bucket = "backend-bucket-ecs"
    lifecycle {
      prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "ecs-s3-bucket-versioning" {
  bucket = aws_s3_bucket.ecs-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ecs-s3-server-side-encryption" {
  bucket = aws_s3_bucket.ecs-s3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "ecs-s3-public-access-block" {
  bucket = aws_s3_bucket.ecs-s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}