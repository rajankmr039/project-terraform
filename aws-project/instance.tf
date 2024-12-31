
# Creating Ec2 Instances.

resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.aws-key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "dev-server"
  }
  # User data
  user_data = file("${path.module}/script.sh")

  connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("${path.module}/id_rsa")
      host = "${aws_instance.web.public_ip}"
    }

    ## Use of Provisioner for file, local-exec, remote-exec
  provisioner "file" {
    source = "readme.md"
    destination = "/tmp/readme.md"
  }
  provisioner "file" {
    content = "Hi, This is Rajan"
    destination = "/tmp/text.md"
    
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >  /tmp/mypublic.txt"
  }
  provisioner "local-exec" {
    interpreter = [ "/usr/bin/python3", "-c" ]
    command = "print('This is usecase for interpreter')"
  }
}


