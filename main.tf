resource "aws_instance" "jenkins_master" {
  ami                    = var.ami_id_ubuntu
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = file(var.jenkins_userdata)
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  subnet_id              = aws_subnet.andynze_public_subnet_01.id
  tags = {
    name = "Jenkins-Sonar-Server"
  }

  root_block_device {
    volume_size = 30
  }
}

#  user_data     = templatefile("./user-data/jenkins_userdata.sh.backup.bk", {})
