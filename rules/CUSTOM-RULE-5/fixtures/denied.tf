resource "aws_redshift_cluster" "denied1" {
  cluster_identifier = "tf-redshift-cluster"
  node_type          = "dc1.large"
  tags = {
    type = "user"
    owner = "team-123"
    email = "team-123@corp-domain.com"
    description = "a tag that describes something"
    serviceDescription = "a tag that describes something"
  }
}

resource "aws_redshift_cluster" "denied2" {
  cluster_identifier = "tf-redshift-cluster"
  node_type          = "dc1.large"
  tags = {
    type = "service"
    owner = "team-123"
    description = "a tag that describes something"
  }
}
