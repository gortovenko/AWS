AWS 2 modules: network and one-tier-vpc 

1 Module "Network" - 3 tier network infrastructure with 1 puclic VPC and 2 Private. 
To be able use for Infrastructure like show below : 

<img width="514" alt="Screenshot 2023-05-25 at 1 11 28 PM" src="https://github.com/gortovenko/AWS/assets/59263138/4f510184-64e6-4149-b2eb-f6c379cc8e6e">

You can add Auto Scalling Group for EKS or EC2 (depends for your project).
Subnets set like list of cidr block you can setup more cidr block and subnets will setup automatically. Minimum 2 cidr block for subnet_vpc1/subnet_vpc2(public/private) cuz availablility zone setup like "a" and "b" on the end of region. If you would be using in the future more than 2 subnets preferred to add more AZ as well.

Load Balancer ( public ) is able in this module as well. 
Main.tf - general maintance file with modules, which shows examples env which was setup, make sure about setup of  new env's ( depend form your project) and create variables.tf files in every modules and main folder. In main folder - setup secret and access keys for you AWS account, in modules folder setup variables and type of it. (necessery!!!!)

Command Running: 
1 terraform init - init terraform modules. 
2 terraform plan  - show which services will launch on AWS. 
3 terraform apply  - apply all changes and launch infrastructure if will apply  "yes" after launch command. 

Command Delete:
1 terraform destroy - if would you like destroy infrastructure 


2 Module "one-tier-vpc" 
In this module describe Network Infrastructura with EKS service ( withouth autoscalling groups ). Load balacer used like internal ( kubernetes ) 
For launch service loadbalancer in k8s, just create service with type loadbalancer in k8s cluster.

Below show netwotk infrastructura how it's looks like

<img width="648" alt="Screenshot 2023-05-25 at 1 26 38 PM" src="https://github.com/gortovenko/AWS/assets/59263138/9c7bf97a-3e5b-4194-9c58-66c9c1159ec2">


Below show netwotking infrastructura with eks service

<img width="651" alt="Screenshot 2023-05-25 at 1 26 56 PM" src="https://github.com/gortovenko/AWS/assets/59263138/e6b547c1-ffa3-494b-bd70-69c0ac41ce8f">

You can check inside of "vpc_one_tier" folder located in folder modules for sure all necessery compomemts which was describel on screenshots. 
Main.tf - shows examples about env, make sure with setup new variables (depend from your project) which are necessery for you. Make sure about setup file in ./modules/vpc_one_tier/varaibles.tf with variables and type of it. 
In general folder(src="./variables.tf") setup varibales.tf file with credentials to your AWS account ( secrets/access keys ). In Main.tf setup variables for module named "one-tier-vpc", in this file show only example what is necessery for run.

Command Running: 
1 terraform init - init terraform modules. 
2 terraform plan  - show which services will run on AWS. 
3 terraform apply  - apply all changes and launch infrastructure if command "yes" after launch command. 

Command Delete:
1 terraform destroy - if would you like destroy infrastructure 

Attention: 
If you would be use only one from 2 modules, make sure module was commented  module or delete module from main.tf file and env. 
