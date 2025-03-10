terraform {
  required_providers {
    pingfederate = {
      source = "pingidentity/pingfederate"
      version = "1.4.3"
    }
  }
}

provider "pingfederate" {
  # Configuration options
  username                            = "administrator"
  password                            = "2FederateM0re"
  https_host                          = "https://pingfederate-admin.jackminer-primary.ping-demo.com"
  admin_api_path                      = "/pf-admin-api/v1"
  insecure_trust_all_tls              = true
  x_bypass_external_validation_header = true
  product_version                     = "12.2"
}