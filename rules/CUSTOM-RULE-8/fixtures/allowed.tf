resource "aws_iam_role" "allowed" {
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  name               = "test_role"
  tags               = {
    "description" = "a role description"
    "owner"       = "team-123@gmail.com"
    "type"        = "Service"
  }
}