module "vpc" {
  source = "terraform-aws-modules/vpc/aws"


  name = var.general_config.vpc_name
  cidr = var.general_config.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.private_subnet_cidr
  public_subnets  = var.public_subnet_cidr

  enable_dns_hostnames = var.general_config.enable_dns_hostnames
  enable_nat_gateway   = var.general_config.enable_nat_gateway
  enable_vpn_gateway   = var.general_config.enable_vpn_gateway
  single_nat_gateway   = var.general_config.single_nat_gateway

  tags = {
    "${var.general_config.first_tag_key}"  = "${var.general_config.first_tag_value}"
    "${var.general_config.second_tag_key}" = "${var.general_config.second_tag_value}"
  }
}

module "sec-group-eks" {
  source = "terraform-aws-modules/security-group/aws"
  depends_on = [
    module.vpc
  ]


  name        = var.sec_group_jenkins.name
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.sec_group_jenkins.ingress_cidr_blocks
  ingress_rules       = var.sec_group_jenkins.ingress_rules
  egress_rules        = var.sec_group_jenkins.egress_rules

}


module "eks" {
  source = "terraform-aws-modules/eks/aws"
    depends_on = [
    module.vpc
  ]

  cluster_name                    = "my-cluster"
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  cluster_encryption_config = [{
    provider_key_arn = "ac01234b-00d9-40f6-ac95-e42345f78b00"
    resources        = ["secrets"]
  }]

  vpc_id     = module.vpc.vpc_id
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]


  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    disk_size              = 50
    instance_types         = ["t3.small"]
    vpc_security_group_ids = [module.sec-group-eks.security_group_id]
  }

  eks_managed_node_groups = {
    green = {
      min_size     = 1
      max_size     = 3
      desired_size = 1

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
      labels = {
        Environment = "test"
        GithubRepo  = "terraform-aws-eks"
        GithubOrg   = "terraform-aws-modules"
      }
      # taints = {
      #   dedicated = {
      #     key    = "dedicated"
      #     value  = "gpuGroup"
      #     effect = "NO_SCHEDULE"
      #   }
      # }
      tags = {
        ExtraTag = "example"
      }
    }
  }
}