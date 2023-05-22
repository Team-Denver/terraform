module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "denver-vpc"

  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

# data "aws_vpc" "poc-vpc"{
#   id = "vpc-09170aa6e3d5dc5bb"
# }

# data "aws_subnet" "poc-vpc-private-us-east-1a"{
#   id = "subnet-07e507cde1968a30f"
# }
# data "aws_subnet" "poc-vpc-private-us-east-1b"{
#   id = "subnet-0b2b6e8781fdeb9cf"
# }
# data "aws_subnet" "poc-vpc-public-us-east-1a"{
#   id = "subnet-014629e7c2ead6914"
# }
# data "aws_subnet" "poc-vpc-public-us-east-1b"{
#   id = "subnet-0c24208d399fbb90e"
# }


