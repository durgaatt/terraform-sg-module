resource "aws_security_group" "main" {
  vpc_id = var.vpc_id
  name = var.secgrp_name
  description = var.secgrp_description

  dynamic ingress {
     for_each = var.sg_ingress_rules #here you will get a variable ingress
    content {
        description      = ingress.value["description"]
        from_port        = ingress.value.from_port
        to_port          = ingress.value.to_port
        protocol         = ingress.value.protocol
        cidr_blocks      = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    {
      Name = "${var.project_name}-${var.secgrp_name}"     
    },
    var.common_tags
  )
}