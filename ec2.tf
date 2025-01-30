resource "aws_instance" "db" {
    ami                    = "ami-0b4f379183e5706b9"
    instance_type          = "t2.micro"
    vpc_security_group_ids = ["sg-006bc654442a8a0cc"]

    provisioner "local-exec" {
        command = "echo ${aws_instance.db.public_ip} >> private_ips.txt"
        # This will write the private IP of the instance to a file
    }
    provisioner "local-exec" {
        command = "ansible-playbook -i private_ips.txt web.yml"
        # This will run the ansible playbook on the private IP of the instance
    }
}