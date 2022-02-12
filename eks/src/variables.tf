variable "general_config" {
  type = map(any)
  default = {
    vpc_cidr             = ""
    zone_1               = ""
    region               = ""
    enable_dns_hostnames = ""
    enable_nat_gateway   = ""
    enable_vpn_gateway   = ""
    single_nat_gateway   = ""

  }
}


variable "sec_group_eks" {
  type = any
  default = {
    ingress_cidr_blocks = ""
    ingress_rules       = ""
    egress_rules        = ""
    name                = ""
  }
}

variable "eks" {
  type = any
  default = {
    cluster_name                    = "my-cluster"
    cluster_version                 = "1.21"
    cluster_endpoint_private_access = false
    cluster_endpoint_public_access  = true

    ami_type                 = "AL2_x86_64"
    disk_size                = 50
    instance_types           = ["t3.small"]
    min_size                 = 1
    max_size                 = 3
    desired_size             = 1
    instance_types           = ["t3.small"]
    capacity_type            = "SPOT"
    Environment              = "test"
    GithubRepo               = "terraform-aws-eks"
    GithubOrg                = "terraform-aws-modules"
    create_iam_role          = true
    iam_role_name            = "eks-managed-node-group-complete-example"
    iam_role_use_name_prefix = false
  }
}



variable "private_subnet_cidr" {
  type    = list(any)
  default = [""]

}

variable "public_subnet_cidr" {
  type    = list(any)
  default = [""]

}

variable "vpc_azs" {
  type    = list(any)
  default = [""]

}

variable "subnets_id" {
  type    = string
  default = ""
}

variable "vpc_id" {
  type    = string
  default = ""
}
