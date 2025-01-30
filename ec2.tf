resource "aws_instance" "db" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-006bc654442a8a0cc"]

    provisioner "local-exec" {
      command = "echo ${aws_instance.db.public_ip} >> private_ips.txt"  # This will write the private IP of the instance to a file
    }
}