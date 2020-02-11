################################################################################################
# This Terraform file defines the variables used in this Terraform
# scripts for this repo.
#
# A Note about API Keys and Access Keys (i.e. paas_apikey, logdna_ingestion_key,
# and sysdig_access_key). For security reasons, the values for these variables should never
# put into GitHub Repo, (i.e terraform.tfvars).  These types of variables values can be hidden
# with DevOps tools such as Jenkins and UrbanCode Deploy. At provisioning time the values
# can be set as Terraform environment variables. Please see Terraform documantaion for details:
# https://www.terraform.io/docs/commands/environment-variables.html#tf_var_name
#################################################################################################


################################################
# IBM Cloud Provider vars
################################################
variable "ibm_cloud_api_key" {} # IBM Cloud API Credentials
variable "ibm_cloud_iaas_classic_username" {}
variable "ibm_cloud_iaas_classic_api_key" {}
variable "ibm_cloud_region" {}
variable "ibm_cloud_generation" {}

################################################
# IBM Cloud account and resource group vars
################################################
variable "account_id" {}
variable "resource_group" {}

################################################
# VPC details
################################################
variable vpc_name {}

#################################################
# Container Cluster variables for main AZ (zone1)
#################################################
#variable "cluster_name" {}
variable "kube_version" {}
variable "num_workers" {} # number of workers per zone

variable "machine_type" {}

variable "zone1" {}
variable "zone2" {}
variable "zone3" {}

variable "zone1_subnet_id" {}
variable "zone2_subnet_id" {}
variable "zone3_subnet_id" {}

variable "disable_public_service_endpoint" {}
