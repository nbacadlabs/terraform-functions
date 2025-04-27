locals {
  vpc_cidr = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
}

resource "aws_vpc" "this" {
  count = length(local.vpc_cidr)

  cidr_block = local.vpc_cidr[count.index]
}