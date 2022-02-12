terraform {
    required_version = ">=0.14.9" 

   backend s3 {
       bucket = "cloudteam-tf-circles"
       key    = "Terraform/circlesup/eks"
       region = "eu-west-3"
   }
}
  