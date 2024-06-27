# creating the s3-buckets
resource "aws_s3_bucket" "bucket" {
  bucket = "myj-mini-bucket1"

tags = {
    Name = "My Static Website"
  }
}

# Configure the S3 bucket for website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Upload the index.html to the S3 bucket
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.bucket.id 
  key    = "index.html"
  content_type = "text/html"
  source = "~/Static_web-terraform/html/index.html" 
}

# Upload the error.html to the S3 bucket
resource "aws_s3_object" "error" { 
  bucket = aws_s3_bucket.bucket.id
  key    = "error.html"
  source = "~/Static_web-terraform/html/index.html"
  content_type = "text/html"
}

# creating cloudfront for the s3-bucket
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "myj-mini-bucket1.s3.us-east-2.amazonaws.com"
    origin_id   = "S3-bucket"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-bucket"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = data.aws_acm_certificate.cert1.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2019"
  }
}
