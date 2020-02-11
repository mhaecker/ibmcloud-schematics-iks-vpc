# Use IBM Schematics Service (Terraform-as-a-Service) to deploy a Kubernetes Service cluster in Virtual Private Cloud (VPC) Infrastructure on IBM Cloud

## Additional information

  **!!! ATTENTION: The deployment of the cluster produces costs in your account !!!**

Keep in mind that you have to delete / cleanup the Kubernetes Service cluster if you don't need it anymore. Otherwise it will be charged on an hourly basis.

## Requirements / Prerequisites:

- IBM Cloud account - Pay-As-You-Go ([IBM Cloud Docs - Account types comparison](https://cloud.ibm.com/docs/account?topic=account-accounts\#liteaccount))  
You receive $200<sup>*</sup> credit if you upgrade from Free Lite to Pay-As-You-Go account plan
- IBM Cloud CLI ([IBM Cloud Docs - CLI](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started)) with Schematics and VPC plugin
- Existing VPC Infrastructure (Gen 1 - on classic) on IBM Cloud
- IBM Cloud Schematics  

(Tested with Terraform v0.11.14 & IBM Cloud Terraform Provider v0.22.0)

## Preparing the environment

1. Install IBM Cloud CLI ([IBM Cloud Docs - Install CLI](https://cloud.ibm.com/docs/cli?topic=cloud-cli-install-ibmcloud-cli))
2. Install Schematics and VPC Plugin for IBM Cloud CLI ([IBM Cloud Docs - Install CLI Plugins](https://cloud.ibm.com/docs/cli?topic=cloud-cli-plug-ins#cli-install-plugin))  

    Login first on the CLI and then run:

    `ibmcloud plugin install schematics`  
    `ibmcloud plugin install vpc-infrastructure`

## Using the template

1. Login to IBM Cloud ([IBM Cloud Login](https://cloud.ibm.com)) or create a new account ([IBM Cloud Registration](https://cloud.ibm.com/registration)).  
Verify that your account has Pay-As-You-Go plan, otherwise upgrade the plan ([Upgrade account](https://cloud.ibm.com/docs/account?topic=account-upgrading-account))

2. Use your existing VPC or create a VPC Infrastructure (Gen 1 - on classic) in a multi-zone region with three zones  
[IBM Cloud Docs - Getting started with Virtual Private Cloud (Gen 1 compute)](https://cloud.ibm.com/docs/vpc-on-classic?topic=vpc-on-classic-getting-started)

3. Create the Workspace in the IBM Cloud Schematics service and retrieve the input variables  

    The information and commands how to retrieve the values for the variables are specified in the _terraform.tfvars_ file.  

    Provide the values for the IBM Cloud account related variables. (These variables are note specified in the tfvars-file):  

    `ibm_cloud_api_key`  
    `ibm_cloud_iaas_classic_username`  
    `ibm_cloud_iaas_classic_api_key`  
    `account_id`

    The VPC related variables like zone-id's and subnet-id's can either be specified in the tfvars-file in the Git repo or in the UI.
    All variables must be set and reviewed to match the existing VPC environment.

4. Continue with "Generate plan"

5. Apply the perviously generated plan to create the Kubernetes Service cluster

6. Cleanup  

    **!!! ATTENTION: Keep in mind that the deployment of the cluster produces costs in your account !!!**  

    To avoid unexpected costs the cluster must be deleted.
    Therefore delete resources the resources in your Schematics workspace. Check "Delete all associated resources" and click delete.

    If you want to delete the resources and the workspace, check both ("Delete all associated resources" and "Delete workspace") checkboxes before you continue with deletion.

    Check the Kubernetes Service UI view that the cluster has been deleted.

---
<sup>*</sup>After you upgrade to a Pay-As-You-Go account, you can use the credit to try new services or scale your projects. The credit is valid for one month and can be used with any of our IBM Cloud offerings.
