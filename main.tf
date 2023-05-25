module "network" {
    source = "./modules/network"
    env = "stage"

    peer_owner_id = var.peer_owner_id

    cidr_block_vpc1 = "10.10.0.0/16"
    cidr_block_vpc2 = "10.20.0.0/16"
    cidr_block_vpc3 = "10.30.0.0/16"

    subnet_vpc1 = ["10.10.10.0/24", "10.10.20.0/24"]
    subnet_vpc2 = ["10.20.10.0/24", "10.20.20.0/24"]
    subnet_vpc3 = ["10.30.10.0/24"]

    peering_vpc2 = "10.2.0.0/24"
    peering_vpc3 = "10.3.0.0/24"


    az_public_subnet_a = "us-east-1a"
    az_public_subnet_b = "us-east-1b"
    az_private_subnet_a = "us-east-1a"
    az_private_subnet_b = "us-east-1b"
}

module "one-tier-vpc" {
  source = "./modules/vpc_one_tier"

    env = "test"
    cidr_block_vpc1 = "10.0.0.0/24"

    cidr_block_public_subnet = ["10.1.0.0/24", "10.2.0.0/24"]
    cidr_block_private_subnet = ["10.3.0.0/24", "10.4.0.0/24"]

    az_public_subnet_a = "us-east-1a"
    az_public_subnet_b = "us-east-1b"
    az_private_subnet_a = "us-east-1a"
    az_private_subnet_b = "us-east-1b"
}