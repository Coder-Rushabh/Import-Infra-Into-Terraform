# Import-Infra-Into-Terraform
Importing Existing Infrastructure (EC2) Into Terraform

Getting the pre-existing cloud resources under the Terraform management is facilitated by Terraform import. import is a Terraform CLI command which is used to read real-world infrastructure and update the state.

Let us begin by importing a simple resource – EC2 instance in AWS. 

## Steps
### Step 1: Configuring the Terraform
Terraform is an infrastructure as a code tool that enables you to safely and predictably provision and manage infrastructure in any cloud.

For this tutorial I'm configuring Terraform on an EC2 instance. You can configure it locally too.
- Launch a simple EC2 instance with the default settings.
![image](https://github.com/Coder-Rushabh/Import-Infra-Into-Terraform/assets/47267236/8b156267-032a-4f8c-888a-806edd5f8583)

