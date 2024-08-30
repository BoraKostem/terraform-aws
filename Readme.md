# AWS EC2 Instance with NGINX - Terraform Project

This repository contains a Terraform project designed to automate the creation and configuration of an AWS EC2 instance with NGINX installed. The project demonstrates the use of Terraform to provision cloud infrastructure, including setting up security groups to manage inbound and outbound traffic.

## Project Overview

### Purpose

The primary purpose of this project is to automate the deployment of a simple web server on AWS using Terraform. The web server is hosted on an EC2 instance, and NGINX is used to serve a basic HTML page. The project also configures security groups to ensure that the instance is accessible over SSH, HTTP, and HTTPS while maintaining security best practices.

### How It Works

- **Terraform Configuration**:
  - The `aws/main.tf` file contains the Terraform code that defines the EC2 instance and its associated security groups.
  - The instance is configured to install NGINX upon startup, replace the default NGINX web page with a custom message, and enable the NGINX service.
  - Security groups are set up to allow SSH, HTTP, and HTTPS traffic to the instance.
  - A `local-exec` provisioner is used to output the public DNS of the instance to a file for easy access.

- **Terraform Module**:
  - The project is structured using Terraform modules, allowing the AWS EC2 resources to be managed and reused efficiently. The `terraform-main/main.tf` file references the `aws` module, specifying variables like the AMI ID, instance type, and AWS region.


### Running the Project

To use this project to create your own AWS EC2 instance with NGINX installed, follow these steps:

1. **Clone the repository**:

   ```bash
   https://github.com/BoraKostem/terraform-aws
   cd terraform-aws
   ```
2. **Configure AWS Credentials**:
    Before running Terraform, ensure that your AWS credentials are set up on your local machine. You can do this by creating a credentials file at ~/.aws/credentials with the following format:

    ```bash
    [default]
    aws_access_key_id = YOUR_ACCESS_KEY_ID
    aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
    ```

    Make sure to replace YOUR_ACCESS_KEY_ID and YOUR_SECRET_ACCESS_KEY with actual AWS credentials.

3. **Configure Terraform Variables**:

   Set the following variables in `terraform-main/variables.tf`:

   - `ami_id`: The ID of the AMI you want to use for your EC2 instance.
   - `instance_type`: The type of EC2 instance to launch (e.g., `t2.micro`).
   - `aws_region`: The AWS region where you want to create the instance.

4. **Initialize Terraform**:

   Initialize the Terraform working directory:

   ```bash
   terraform init
   ```

5. **Apply the Terraform Configuration**:

   Apply the configuration to create the resources:

   ```bash
   terraform apply
   ```

   Confirm the plan by typing `yes` when prompted.

6. **Access Your Instance**:

   The public DNS of the EC2 instance will be saved in `ip_address.txt` upon successful creation. You can open this address in your web browser to see the NGINX welcome page.

7. **Destroying Resources**:

   When you’re done, you can clean up the resources by running:

   ```bash
   terraform destroy
   ```

   Confirm the destruction by typing `yes`.

Author: Bora Fenari Köstem
