resource "aws_redshift_cluster" "denied2" {
  cluster_identifier = "tf-redshift-cluster"
  node_type          = "dc1.large"
  tags = {
    description = "description",
  }
}
