output "bucket_name" {
  value = "myj-mini-bucket1"
}

output "cloudfront_domain" {
  value = "myj-mini-bucket1.s3.us-east-2.amazonaws.com"
}

output "route53_zone_id" {
  value = "aws_route53_zone.main.id"
}
