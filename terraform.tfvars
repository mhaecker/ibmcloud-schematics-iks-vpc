################################################################################################
# This file is where you place the input values to run the automation.
# You can replace the tokens @XXX@ with your input values.
#
# A Note about API Keys and Access Keys (i.e. paas_apikey, logdna_ingestion_key,
# and sysdig_access_key). For security reasons, the values for these variables should never
# put into GitHub Repo, (i.e terraform.tfvars).  These types of variables values can be hidden
# with DevOps tools such as Jenkins and UrbanCode Deploy. At provisioning time the values
# can be set as Terraform environment variables. Please see Terraform documantaion for details:
# https://www.terraform.io/docs/commands/environment-variables.html#tf_var_name
#################################################################################################

################################################
# IBM Cloud provider vars
################################################

#############
# ATTENTION #
#############
# It's not reccomended to put credentials in source repositories.
# We recommend to provide the variables as environment variables

### Retrieve booth from IBM Cloud UI. Manage > Access (IAM) > IBM Cloud API keys
#ibm_cloud_iaas_classic_username = "<iaas classic user id>"
#ibm_cloud_iaas_classic_api_key = "<iaas classic api key>"
#
### Use existing / create a new IBM Cloud API Key
# Key can only be retrieved on creation time.
# UI: Manage > Access (IAM) > IBM Cloud API keys --> "Create an IBM Cloud API Key"
# CLI: ibmcloud iam api-key-create <name of the key> -d <description of the key>
#ibm_cloud_api_key = "<ibm cloud api key>"

# ibmcloud regions
ibm_cloud_region = "eu-de"

# ibmcloud is target
ibm_cloud_generation = "1"

################################################
# IBM Cloud account and resource group vars
################################################
# ibmcloud account list
#account_id  = "<account id>"
# ibmcloud resource groups
resource_group = "default"

################################################
# VPC details
################################################
# ibmcloud is vpcs
vpc_name = "my-vpc-1"

################################################
# Container Cluster variables for main AZ
################################################
#cluster_name    = "my-iks-vpc-1"
# ibmcloud ks versions
kube_version    = "1.16"
num_workers     = "1" # number of nodes per zone

# To get the target zone ( <zone> ), use the following:
# ibmcloud ks zones --provider vpc-classic
zone1 = "eu-de-1"
zone2 = "eu-de-2"
zone3 = "eu-de-3"

# ibmcloud ks flavors --zone <zone>
machine_type = "c2.2x4"

# Network subnet of zone1
zone1_subnet_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
zone2_subnet_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
zone3_subnet_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# Enable or disable public endpoint of master nodes.
# Disabling requires VPN connection, Virtual Routing and Forwarding (VRF) and Cloud Service Endpoint (CSP)
disable_public_service_endpoint = "false"
