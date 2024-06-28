variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "myj-mini-bucket1"
}

variable "domain_name" {
  description = "The domain name for the static website"
  type        = string
  default     = "static-web-hosting.kesug.com"
}

variable "certificate_arn" {
  description = "The ARN of the existing SSL certificate"
  type        = string
  default     = "arn:aws:acm:us-east-1:069112940474:certificate/211930db-2c6c-4145-81b4-44efd94b5a51"
}
