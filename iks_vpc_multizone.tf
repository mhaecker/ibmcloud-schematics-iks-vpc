##########################################################################################################################
# This terraform file defines the resources for IBM Kubernetes Service (IKS) clusters on VPC classic.
# For more information on IKS, see https://cloud.ibm.com/docs/containers?topic=containers-getting-started
# For more information on the Terraform Provider resource for creating the clusters
# see https://ibm-cloud.github.io/tf-ibm-docs/v0.22.0/r/container_cluster.html
##########################################################################################################################

#################################
#  Get the Resource Group ID
##################################
data "ibm_resource_group" "group" {
  name = "${var.resource_group}"
}
data ibm_is_vpc vpc {
  name = "${var.vpc_name}"
}

#########################################
#  Create random suffix for cluster name 
#########################################
resource "random_id" "suffix" {
  byte_length = 2
}

#######################################################
#  Create the kubernetes cluster resource in zone 1.
########################################################
resource "ibm_container_vpc_cluster" "vpc_cluster" {
  name = "${data.ibm_is_vpc.vpc.name}-${random_id.suffix.hex}" 
  vpc_id = "${data.ibm_is_vpc.vpc.id}"
  kube_version = "${var.kube_version}"
  flavor = "${var.machine_type}"
  worker_count = "${var.num_workers}"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  disable_public_service_endpoint = "${var.disable_public_service_endpoint}"
  zones = [
    {
      subnet_id = "${var.zone1_subnet_id}"
      name = "${var.zone1}"
    },
    {
      subnet_id = "${var.zone2_subnet_id}"
      name = "${var.zone2}"
    },
    {
      subnet_id = "${var.zone3_subnet_id}"
      name = "${var.zone3}"
    }
  ]
}
