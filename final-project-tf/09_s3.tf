resource "aws_s3_bucket" "hbinT_s3_bucket" {
  bucket = "hbint-bucket"
  acl    = "private"
  # force_destroy = true
  tags = {
    Name = "${var.tag}-s3-bucket"
  }
}

# resource "aws_s3_bucket_acl" "hbinT_s3_bucket_acl" {
#   bucket = aws_s3_bucket.hbinT_s3_bucket.id
#   acl    = "private"
# }

resource "aws_s3_bucket_versioning" "hbinT_s3_bucket_versioning" {
  bucket = aws_s3_bucket.hbinT_s3_bucket.id

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.hbinT_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.hbinT_s3_bucket.id

  rule {
    id     = "DisableBucketKeys"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }
}
