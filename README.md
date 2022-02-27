# oracle-interview

## Installation
This chef codes deploys a simple python flask application to multiple ec2 instances managed by auto scaling groups
## Usage
Follow the following steps to deploy the infrastructure provisioning and configuration management
1. Setup chef server and workstations 
2. Deploy the infrastructure codes for chef nodes using the infrastructure-deployment code 
    terraform init 
    terraform plan 
    terraform apply
   This will provision 3 ec2 instances that can be autoscaled by updating the default values defined in the variables file 
   
3. Ones the infrastructure is deployed, chef code is then executed to the managed nodes and nginx and Flask web server 
will be installed and configured
   
4.The load balancer url should display host informations as defined in the python code 

5. A inspec tests is included to test that nginx is deployed on the managed nodes 

