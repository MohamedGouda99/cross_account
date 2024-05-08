variable "vpc_id" {}

variable "web_security_group" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Different MVE2_ImpaCT_SIMSAM and MVE2_ConneCT_SIMSAM to Webserver connections"
      from_port   = 80
      to_port     = 95
      protocol    = "tcp"
      cidr_blocks = ["10.64.43.69/32", "10.64.43.65/32", "10.64.43.22/32", "10.64.43.23/32", "10.64.43.32/32", "10.64.43.33/32"]
    },
    {
      description = "Different MVE2 DSS App and HIX Batch to SSRS, SIMSAM, and LDAP connections"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["159.247.85.52/32", "10.64.43.17/32", "10.64.51.226/32", "10.64.41.226/32"]
    },
    {
      description = "IP range 172.16.23.0/24"
      from_port   = 60001
      to_port     = 60001
      protocol    = "tcp"
      cidr_blocks = ["172.16.23.0/24"]
    },
    {
      description = "AVD to LB"
      from_port   = 9082
      to_port     = 9082
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