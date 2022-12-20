region              = "us-east-1"
profile             = "devops"
cidr_block          = "10.20.0.0/16"
vpc_name            = "devops3"
azs                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidr  = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
private_subnet_cidr = ["10.20.10.0/24", "10.20.20.0/24", "10.20.30.0/24"]
key_name            = "laptopkey"
imagename           = "ami-0a6b2839d44d781b2"
instance_type       = "t2.micro"
env                 = "prod"
 