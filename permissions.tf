resource "aws_iam_role" "s3_access_role" {
  name = "s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "s3.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name   = "s3_access_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListBucket", "s3:GetObject"]
        Effect   = "Allow"
        Resource = ["${aws_s3_bucket.bucket.arn}/*"]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
  role       = aws_iam_role.s3_access_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}
