variable "env" {
    description = "this is the enviroment for my infra"
    type = string
  
}
variable "bucket_name" {
 //   default = "dev"
  description = "my-bucket-var"
  type = string
}
variable "instance_count" {
   description = "this is the no. of ec2 instance"
   type = number
}
variable "instance_type" {
  description = "this the instance type "
  type = string
}
variable "ec2_ami_id" {
    description = "this is the ami number in ubuntu"
    type = string
    
}
variable "hash_key" {
    description = "its for the hash_key for my dynamodb infra "
    type = string
  
}
variable "ec2_root_storage_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 8
}
