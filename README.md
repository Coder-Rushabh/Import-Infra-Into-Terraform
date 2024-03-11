# Import-Infra-Into-Terraform
Importing Existing Infrastructure (EC2) Into Terraform

Getting the pre-existing cloud resources under the Terraform management is facilitated by <code>Terraform import<code> . import is a Terraform CLI command which is used to read real-world infrastructure and update the state.

Let us begin by importing a simple resource – EC2 instance in AWS. 

## Steps
### Step 1: Configuring the Terraform
Terraform is an infrastructure as a code tool that enables you to safely and predictably provision and manage infrastructure in any cloud.

For this tutorial I'm configuring Terraform on an EC2 instance. You can configure it locally too.
- Launch a simple EC2 instance with the default settings.
  
![image](https://github.com/Coder-Rushabh/Import-Infra-Into-Terraform/assets/47267236/8b156267-032a-4f8c-888a-806edd5f8583)

#### AWS CLI Configuration
The AWS Command Line Interface (AWS CLI) is an open-source tool from Amazon Web Services (AWS). You can use it to interact with AWS services using commands in your command line shell.
- Create a new IAM user with an administratorAccess role.
- Create an access key by selecting the CLI option.
- Turn off the administrator and user option in Internet Enhanced Security Configuration.
![image](https://github.com/Coder-Rushabh/Import-Infra-Into-Terraform/assets/47267236/47a65803-3dc3-40fc-9c34-d88e472fe71d)
- Now download <a href src="https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html?source=post_page-----9738a270d68e-------------------------------->AWS CLI</a> in the EC2 instance and install it.
- Then open cmd and run as administrator.
- Run the command to check if AWS CLI is installed properly or not. <code> aws --version</code>






#### Terraform Installation
