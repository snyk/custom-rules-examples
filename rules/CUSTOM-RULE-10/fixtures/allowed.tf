resource "aws_iam_user" "denied" {
  name = "loadbalancer"
  path = "/system/"
  tags               = {
    "description" = "a role description"
    "type"        = "Service"
    "owner"        = "owner"
  }
}