module "helm_tests3" {
    source = "../modules/s3_temp"
    account_id = "330263117268"
    user_id    = "liuzhenwang"
    tags ={
        Name = "helm-repository-20211127"
        client = "helm"
        environment = "tests3"
        
    }

    
}


#initial helm repo
resource "aws_s3_bucket_object" "object" {
  bucket    = module.helm_tests3.main_bucket
  key       = "charts/index.yaml"
  source    = "helm-files/index.yaml"

}

output "main_bucket" {
    value = module.helm_tests3.main_bucket
}

output "tags" {
    value = module.helm_tests3.tags
}