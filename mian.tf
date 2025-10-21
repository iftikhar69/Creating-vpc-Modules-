module "iftu-dev-infra" {
    source = "./infra-app"
    env = "dev"
    bucket_name = "iftu-bucket-s3"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_root_storage_size  = 15   # override default 8 GB
    ec2_ami_id = "ami-0933f1385008d33c4"  # ubuntu /A mazone
    hash_key = "studentID"
}
module "iftu-prd-infra" {
    source = "./infra-app"
    env = "prd"
    bucket_name = "iftu-bucket-s3"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_root_storage_size  = 15   # override default 8 GB
    ec2_ami_id = "ami-0933f1385008d33c4"  # ubuntu /A mazone
    hash_key = "studentID"
}
module "iftu-stg-infra" {
    source = "./infra-app"
    env = "stg"
    bucket_name = "iftu-bucket-s3"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_root_storage_size  = 15   # override default 8 GB
    ec2_ami_id = "ami-0933f1385008d33c4"  # ubuntu /A mazone
    hash_key = "studentID"
}