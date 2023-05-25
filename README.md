# AWS
Three tire Network Infrastructure 
- VPC 1 - public VPC with LB inside 
- VPC 2 - private VPC for frontend app 
- VPC 3 - private VPC for DB 

VPC 1 and VPC 2 , VPC 2 and VPC 3 has a VPC peering connection.  IGW - in VPC1. 

Commands: 
1 create variables.tf file and setup your personal secret and access keys. 
2 terraform init command 
3 terraform plan command 
4 terraform apply if you agree

Attancion: 
In the main.tf file put in or change env like cidr_block and etc. In my case using this env for showing example. 

Allowed access via used security group to the next ports: 80, 443, 3000, 1337 and atached in vpc1 and vpc2. vpc3 used only 5432 regular postgres port. 
If you would be change it make sure security-group.tf file, customize list of port. Additionly, subnets could be customized via setup env in main.tf file. 1 or more cidr blocks.
