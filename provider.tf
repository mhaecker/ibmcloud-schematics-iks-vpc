#####################################################################
# This terraform file defines the terraform provider that is used
# to deploy the architecture. In this case, the IBM Cloud provider is
# the only provider that will be used. The two variables provide the
# means to deploy workloads. However, the APIkey and IBMid must have
# the permissions to deploy this architecture's resources.
# For more information on the IBM Provider arguments
# see https://ibm-cloud.github.io/tf-ibm-docs/v0.22.0/
#####################################################################

provider "ibm" {
  ibmcloud_api_key      = "${var.ibm_cloud_api_key}"
  iaas_classic_username = "${var.ibm_cloud_iaas_classic_username}"
  iaas_classic_api_key  = "${var.ibm_cloud_iaas_classic_api_key}"
  region                = "${var.ibm_cloud_region}"
  generation            = "${var.ibm_cloud_generation}"
  version               = ">=0.20, <=0.29"
}

provider "random" {
  version = "~> 2.2"
}