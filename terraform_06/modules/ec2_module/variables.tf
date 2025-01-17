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