variable "project_name" {
  
}
variable "vpc_id" {

}

variable "secgrp_name" {
  default = {}
}

variable "secgrp_description" {
  default = {}
}

variable "sg_ingress_rules" {
  type = list
  default = []
}
variable "common_tags" {
  default = {
   
  }
}