module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.24"

  vpc_id     = data.aws_vpc.poc-vpc.id
  control_plane_subnet_ids = tolist([data.aws_subnet.poc-vpc-private-us-east-1a.id, data.aws_subnet.poc-vpc-private-us-east-1b.id])
  subnet_ids = tolist([data.aws_subnet.poc-vpc-public-us-east-1a.id, data.aws_subnet.poc-vpc-public-us-east-1b.id])
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
