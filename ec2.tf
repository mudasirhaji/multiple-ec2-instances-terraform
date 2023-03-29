resource "aws_instance" "my-ec2" {
   ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  count = 5

  tags = {
    Name = "my-ec2-machines"

    
  }
}