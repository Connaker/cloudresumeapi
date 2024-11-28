# S3 Bucket for Static Website
resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket
}

resource "aws_s3_bucket_ownership_controls" "owner_controls" {
  bucket = aws_s3_bucket.static_site.id
  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_public_access_block" "pub_access_blk" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.owner_controls,
    aws_s3_bucket_public_access_block.pub_access_blk,
  ]

  bucket = aws_s3_bucket.static_site.id
  acl    = var.public_acl
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.owner_controls]

  bucket = aws_s3_bucket.static_site.id
  acl    = var.private_acl
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = var.suffix
  }

  error_document {
    key = var.s3_error_key
  }

  routing_rule {
    condition {
      key_prefix_equals = var.key_prefix_equals
    }
    redirect {
      replace_key_prefix_with = var.replace_key_prefix_with
    }
  }
}

resource "aws_s3_bucket_policy" "static_site_policy" {
  bucket = aws_s3_bucket.static_site.id

  policy = var.s3_bucket_policy
}