# oracle take home assignment

## overview
This chef codes deploys a simple python flask application to multiple ec2 instances managed by auto scaling groups.

### The following tasks was completed.
1. Setup chef server and workstations to deploy configurations to managed nodes on AWS 
2. Provision Nginx and enabled the service on the nodes 
3. Provision Flasks and deploy a python application to serve server information to the clients 
4. Provisioned required infrastructures using auto scaling groups to manage instances nodes and security groups to open required 
   ports for the managed nodes 
5. Deployed Loadbalancer to route traffics to the managed nodes 
6. Rspec tests to validate the services are installed and running

## Usage
Follow the following steps to deploy the infrastructure provisioning and configuration management for the python application.
1. Setup chef server and workstations 
2. Deploy the infrastructure codes for chef nodes using the infrastructure-deployment code. 
3. This will provision 3 ec2 instances that can be autoscaled by updating the default values defined in the variables file 
   
4. Ones the infrastructure is deployed, chef code is then executed to the managed nodes and nginx and Flask web server 
    will be installed and configured
   
5.The load balancer url should display host information as defined in the python code 

6. A Rspec tests is included to test that nginx is deployed on the managed nodes 

