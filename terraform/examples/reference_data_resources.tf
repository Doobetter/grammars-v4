data "aws_ami" "main" {
  name = "abc"
}

resource "aws_instance" "main" {
  ami = data.aws_ami.main.id
}

locals {
  vpce_consumer_arns = ["1", "2", "3"]
}

resource "aws_vpc_endpoint_service_allowed_principal" "vpce_producer_allowed_consumers" {
  count = length(local.vpce_consumer_arns)

  vpc_endpoint_service_id = "this is an id"
  principal_arn           = local.vpce_consumer_arns[count.index]
}
