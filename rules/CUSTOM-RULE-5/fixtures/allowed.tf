resource "aws_redshift_cluster" "allowed1" {
  cluster_identifier = "tf-redshift-cluster"
  node_type          = "dc1.large"
  tags = {
    type = "user"
    owner = "team-123"
    email = "team-123@corp-domain.com"
    description = "a tag that describes something"
  }
}

resource "aws_redshift_cluster" "allowed2" {
  cluster_identifier = "tf-redshift-cluster"
  node_type          = "dc1.large"
  tags = {
    type = "service"
    owner = "team-123"
    description = "a tag that describes something"
    serviceDescription = "a tag that describes a service"
  }
}
