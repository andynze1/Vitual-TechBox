resource "aws_instance" "jenkins_master" {
  ami           = var.ami_id_ubuntu
  instance_type = var.instance_type
  key_name      = var.key_name
#  user_data     = templatefile("./user-data/jenkins_userdata.sh", {})
  user_data     = file(var.jenkins_userdata)

  tags = {
    name = "Jenkins-Sonar-Server"
  }
  root_block_device {
    volume_size = 40
  }
}