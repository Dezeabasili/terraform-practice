variable "Public-subnet-id" {
  type = string
}

variable "Private-subnet-id" {
  type = string
}

variable "FE-Security-groups-id" {
  type = set(string)
}

variable "BE-Security-groups-id" {
  type = set(string)
}

variable "Public-Key-name" {
  type = string
}

variable "ami-id" {
  type = string
  default = "ami-0e2c8caa4b6378d8c"
}

variable "instance-type" {
  type = string
  default = "t2.micro"
}

# variable "key-id" {
#   type = string
# }