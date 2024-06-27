data "aws_acm_certificate" "cert1" {
  domain   = "static-web-hosting.com"
  statuses = ["ISSUED"]
}
