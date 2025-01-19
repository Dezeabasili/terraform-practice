provider "aws" {
  region = "us-east-1"
}

# Use the code below to import an EC2 instance and the comment out
# import {
#   id = "i-029bfb3542557ec78"
#   to = aws_instance.imported-EC2
# }


# The code below is copied from the imported file
resource "aws_instance" "imported-EC2" {
  ami                                  = "ami-04b4f1a9cf54c11d0"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1c"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  enable_primary_ipv6                  = null
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = null
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  key_name                             = "Ansible-11Jan"
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  private_ip                           = "172.31.24.250"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-4"]
  source_dest_check                    = true
  subnet_id                            = "subnet-06bbe8ab438c41ad4"
  tags = {
    Name = "Terraform-node"
  }
  tags_all = {
    Name = "Terraform-node"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-00120bf3d73aa32bc"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    kms_key_id            = null
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}
