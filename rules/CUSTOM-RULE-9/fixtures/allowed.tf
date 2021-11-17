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
    "description"    = "a role description"
    "type"           = "Service"
    "owner"          = "team-123@gmail.com"
    "owneralternate" = "abc"
    "ticketgroup"    = "ecd"
  }
}

resource "aws_iam_role" "allowed2" {
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
    "description"    = "a role description"
    "type"           = "Service"
    "owner"          = "team-123@gmail.com"
    "owneralternate" = "abc"
  }
}

resource "aws_iam_role" "allowed3" {
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
    "type"        = "Service"
    "owner"       = "team-123@gmail.com"
    "ticketgroup" = "abc"
  }
}

resource "aws_iam_role" "allowed4" {
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
    "description"    = "a role description"
    "type"           = "Vendor"
    "owner"          = "team-123@gmail.com"
    "owneralternate" = "abc"
    "ticketgroup"    = "abc2"
  }
}

resource "aws_iam_role" "allowed5" {
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
    "description"    = "a role description"
    "type"           = "Vendor"
    "owner"          = "team-123@gmail.com"
    "owneralternate" = "abc"
  }
}

resource "aws_iam_role" "allowed6" {
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
    "type"        = "Service"
    "owner"       = "team-123@gmail.com"
    "ticketgroup" = "abc"
  }
}