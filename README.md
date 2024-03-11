# Import-Infra-Into-Terraform
Importing Existing Infrastructure (EC2) Into Terraform

Getting the pre-existing cloud resources under the Terraform management is facilitated by <code>Terraform import</code>. import is a Terraform CLI command which is used to read real-world infrastructure and update the state.

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
</br>
- Now download <a href src="https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html?source=post_page-----9738a270d68e--------------------------------">AWS CLI</a> in the EC2 instance and install it.
- Then open cmd and run as administrator.
- Run the command to check if AWS CLI is installed properly or not. <code> aws --version</code>

#### Terraform Installation
- Log into the instance.
- Download Terraform and make a Terraform folder in C-drive and move the .exe file to it.
- Setup environment variable.
- Download the VS code and install Terraform plugins.

  Suppose we have one another EC2 instance (server102) running in our AWS account that someone created manually. Now we want to import that in Terraform.

### Step 2: Create main.tf and Set Provider Configuration
The aim of this step is to import this EC2 instance into our Terraform configuration.
- Create a folder in C-drive and open it in VS code. Write down the below code in the <code> main.tf </code> file.
```
      provider "aws" {
          region = "us-east-1"
      }
      resource "aws_instance" "server102" {
          ami = "unknown"
          instance_type = "unknown"
      }
  ```
The only reason I have included ami and instance_type attribute, is that they are the required arguments for aws_instance resource block.

- Open the terminal and enter below command.
- <code>terraform init </code> - for initializing terraform
- <code>aws configure </code> - to authenticate user
- Enter Access key and Secret access key.

### Step 3: Import
Think of it as if the cloud resource (EC2 instance) and its corresponding configuration were available in our files. All that’s left to do is to map the two into our state file. We do that by running the import command as follows.
- <code> terraform import aws_instance.server102 instance_id </code>

A successful output should look like this:

![image](https://github.com/Coder-Rushabh/Import-Infra-Into-Terraform/assets/47267236/d8a89f5f-4466-4b1b-a02d-0344dd2d92db)


### Step 4: Observe State Files and Plan Output
Please notice that the directory now also contains terraform.tfstate file. This file was generated after the import command was successfully run.
- Get values instance parameter from state file and replace with the <code>unknown</code> keyword.

```
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server102" {
  ami = "ami-0f9c44e98edf38a2b"
  instance_type = "t2.micro"
  tags = {
    Name = "server102"
  }
}
```


- Enter command - <code>terraform plan</code>

![image](https://github.com/Coder-Rushabh/Import-Infra-Into-Terraform/assets/47267236/d9935914-0188-47aa-92ca-6080a8426d77)

This time the plan does not indicate the replacement of the EC2 instance. If you get the same output, you are successful in partially importing our cloud resource. You are currently in a state of lowered risk—if we apply the configuration now, the resource will not be replaced, but a few attributes would change.

To destroy instance, enter command <code>terraform destroy --auto-approve</code>

![image](https://github.com/Coder-Rushabh/Import-Infra-Into-Terraform/assets/47267236/e842105e-5889-4f6c-84e0-88a2249b3bae)

This will terminate the instance.

![image](https://github.com/Coder-Rushabh/Import-Infra-Into-Terraform/assets/47267236/00971d8f-4bf9-4384-9bfa-2adad6ba3916)







  
