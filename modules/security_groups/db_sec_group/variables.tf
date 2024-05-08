variable "vpc_id" {}

variable "db_security_group" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "AWS to AVD"
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = ["172.16.23.0/24"]
    },
    {
      description = "MVE2 File Shares within the VPC"
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = ["172.24.169.0/27"]
    },
    {
      description = "TEMP DMS20240306 - Allow inbound SMB from MVE03"
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = ["172.24.169.64/26"]
    },
    {
      description = "AWS to AVD"
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = ["172.16.23.0/24"]
    },
    {
      description = "On-Prem LDAP and MVE2 DSS App to SIM-SAM LDAP"
      from_port   = 389
      to_port     = 389
      protocol    = "tcp"
      cidr_blocks = ["10.64.51.229/32", "10.64.41.228/32"]
    },
    {
      description = "MVE2 DSS App to SIM-SAM LDAP and On-Prem LDAP"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
      cidr_blocks = ["10.64.41.228/32", "10.64.51.229/32"]
    },
    {
      description = "DB2 to App Ports"
      from_port   = 60000
      to_port     = 60005
      protocol    = "tcp"
      cidr_blocks = ["172.24.169.0/27"]
    },
    {
      description = "MVE2 DSS App to SSRS"
      from_port   = 9443
      to_port     = 9443
      protocol    = "tcp"
      cidr_blocks = ["159.247.85.52/32"]
    },
    {
      description = "AVD to AWS Multi-Vendor VPC"
      from_port   = 9040
      to_port     = 9085
      protocol    = "tcp"
      cidr_blocks = ["172.16.23.0/24"]
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