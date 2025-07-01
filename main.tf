provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "master" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = "trileKey3"   
  tags = {
    Name = "Master-VM"
    Env  = var.environment
  }
  user_data = file("scripts/deploy-java.sh")
}

resource "aws_instance" "slave" {
  count         = 2
  ami           = var.ami_id
  instance_type = "t2.micro"
key_name = "trileKey3" 
  tags = {
    Name = "Slave-VM-${count.index + 1}"
    Env  = var.environment
  }
  user_data = file("scripts/deploy-java.sh")
}
