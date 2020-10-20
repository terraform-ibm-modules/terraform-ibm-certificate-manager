############################################################################
# IBM Cloud certificate manager Provisioning, Import and order Certificates
# Copyright 2020 IBM
############################################################################

data "ibm_resource_instance" "cms_instance" {
  name     = var.service_intance_name
  location = var.region
  service  = "cloudcerts"
}

module "import_from_file" {
  source                          = "../../../modules/ibm-cms-import"
  certificate_manager_instance_id = data.ibm_resource_instance.cms_instance.id
  name                            = var.name
  description                     = var.description
  certificate_file                = file(var.certificate_file)
  priv_key_file                   = var.priv_key_file
  intermediate_certificate_file   = var.intermediate_certificate_file
}