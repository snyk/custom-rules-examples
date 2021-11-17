resource "aws_iam_user" "denied" {
  name = "loadbalancer"
  path = "/system/"
  tags               = {
    "description" = "a role description"
    "type"        = "Service"
  }
}

resource "aws_iam_user" "denied2" {
  name = "loadbalancer"
  path = "/system/"
  tags               = {
    "description" = "a role description"
  }
}

resource "aws_iam_user" "denied3" {
  name = "loadbalancer"
  path = "/system/"
  tags               = {
    "owner" = "team-123@gmail.com"
  }
}

resource "aws_iam_user" "denied4" {
  name = "loadbalancer"
  path = "/system/"
  tags               = {
    "type" = "Service"
  }
}