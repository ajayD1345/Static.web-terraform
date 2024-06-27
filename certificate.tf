resource "aws_acm_certificate" "cert2" {
  domain_name       = "static-web-hosting.com"
  validation_method = "DNS"
}
