variable "vpc_id" {}

variable "app_security_group" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "MVE2 DSS App Server and HIX Batch to Symantec"
      from_port   = 1344
      to_port     = 1344
      protocol    = "tcp"
      cidr_blocks = ["159.247.84.34/32", "159.247.84.35/32", "159.247.84.36/32", "159.247.84.37/32", "159.247.84.38/32"]
    },
    {
      description = "MVE2 DSS App to Local LDAP"
      from_port   = 50000
      to_port     = 50000
      protocol    = "tcp"
      cidr_blocks = ["159.247.85.166/32"]
    },
    {
      description = "MVE2 VPC to AWS DNS Resolver"
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_blocks = ["172.24.4.154/32", "172.24.4.230/32"]
    },
    {
      description = "ICMP Local to VPC"
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = ["172.24.169.0/27"]
    },
    {
      description = "ICMP Check from 159.247.200.0/24"
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = ["159.247.200.0/24"]
    },
    {
      description = "UAT workplace FileNet to App"
      from_port   = 7801
      to_port     = 7801
      protocol    = "tcp"
      cidr_blocks = ["159.247.85.18/32"]
    },
    {
      description = "MVE2 Batch to UAT workplace FileNet"
      from_port   = 9084
      to_port     = 9085
      protocol    = "tcp"
      cidr_blocks = ["159.247.105.216/32"]
    },
    {
      description = "MVE2 HIX APP to Robot help and SMTP"
      from_port   = 7003
      to_port     = 7003
      protocol    = "tcp"
      cidr_blocks = ["10.233.2.109/32", "10.233.2.106/32"]
    },
    {
      description = "Various MVE2 HIX Batch purposes"
      from_port   = 9022
      to_port     = 9022
      protocol    = "tcp"
      cidr_blocks = ["159.247.4.114/32", "159.247.4.122/32", "159.247.4.121/32"]
    },
    {
      description = "MVE2 Batch to UAT FileNet"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["159.247.105.212/32"]
    },
    {
      description = "MVE2 HIX Application Server to LDAP"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["159.247.0.136/32"]
    },
    {
      description = "MVE2 DSS App to Local LDAP"
      from_port   = 9389
      to_port     = 9389
      protocol    = "tcp"
      cidr_blocks = ["159.247.85.166/32"]
    },
    {
      description = "UAT Datapower and FileNet to MVE2 App"
      from_port   = 4443
      to_port     = 4443
      protocol    = "tcp"
      cidr_blocks = ["10.64.43.16/32", "10.64.43.17/32"]
    }
  ]
}

variable "egress_rule" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    description = "Allow egress to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}
                   