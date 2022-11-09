### Requirements
- Terraform >= v1.1.9 

### Description
- The provided architecture was implemented as code using Terraform.
- A service principal named "terraform" was also deployed and granted contributor access to the provided sub.
- Terraform needs the service principal in order to authenticate to Azure.
- The app service is autoconfigured upon deployment to pull the code from the provided repo
- It is also configured to backup to the deployed storage account
- The sql server and databases are also deployed and set to be linked to each other using terraform.

### How to run
- Ensure you have the preferred version of terraform installed
- clone repo
- cd to the same directory as the main.tf file
- Run "terraform init" on your console.
- Run "terraform plan" to have an idea of what terraform would do.
- Run "terraform apply --auto-approve" to apply the changes.