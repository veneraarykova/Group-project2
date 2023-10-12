variable region {
    type = string 
    default = "us-east-2" 
}


variable ec2_type {
    type = string 
    default = "t2.micro"
}


variable vpc_cidr {
    type = string 
    default = "10.0.0.0/16" 
}

variable common_tags{
    type = string 
    default = "Group-1"
}

variable subnet_cidr1 {
    type = string 
    default = "10.0.1.0/24" 
}
variable subnet_cidr2 {
    type = string 
    default = "10.0.2.0/24" 
}

variable subnet_cidr3 {
    type = string 
    default = "10.0.3.0/24" 
}

variable private_subnet_cidr1 {
    type = string 
    default = "10.0.101.0/24" 
}

variable private_subnet_cidr2 {
    type = string 
    default = "10.0.102.0/24" 
}

variable private_subnet_cidr3{
    type = string 
    default = "10.0.103.0/24" 
}

variable az1 {
    type = string 
    default = "us-east-2a" 
}
variable az2 {
    type = string 
    default = "us-east-2b" 
}
variable az3 {
    type = string 
    default = "us-east-2c" 
}

variable ip_on_launch {
    type = bool 
    default = true
}

variable sg_group {
    type = string 
    default = "security_group" 
}


variable default_cidr_block {
    type = string
    default = "0.0.0.0/0"
}