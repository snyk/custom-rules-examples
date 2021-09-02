resource "aws_redshift_cluster" "allowed" {
  cluster_identifier = "tf-redshift-cluster"
  node_type          = "dc1.large"
  tags = {
    owner = "team-123@corp-domain.com"
    description = "a tag that describes something"
  }
}
