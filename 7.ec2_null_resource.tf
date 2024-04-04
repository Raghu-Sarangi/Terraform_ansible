resource "null_resource" "cluster" {
  count = var.env == "dev" || var.env == "uat" || var.env == "prod" ? 3 : 1
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("DevOps.pem")
      #host     = "${aws_instance.web-1.public_ip}"
      host = element(aws_instance.web-1.*.public_ip, count.index)
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo useradd -m ansibleadmin --shell /bin/bash",
      "sudo mkdir -p /home/ansibleadmin/.ssh",
      "sudo chown -R ansibleadmin /home/ansibleadmin/",
      "sudo touch /home/ansibleadmin/.ssh/authorized_keys",
      "sudo usermod -aG sudo ansibleadmin",
      "echo 'ansibleadmin ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers",
      "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD2zXGcKdM9Bskrnv5tJPNgldTptzKQm+8GIlOp1nnGmfOgQwMAnm7XKIYh0paGX3Txtm6kbeOLvBPT1E77Lk/+9/XUkft+7Ygf412zQ9szGfoUb0GmsIF9jDmcf/9xPIbuE+ZzxHG1bh6nfYtYT/YnUIlxL3lF/ODYNRo3ZnIIZYB7ntKLJ9qqWKv5MUkx+j3AtmzI277X6ZCztlKbQqh7b6w19d/dbkNOyc2dLUgZX/fOmFnAt9vUg3kHISxC4ZvLCzEFil4F4d4MPI1lroIJNOZFKIgoqLSTiUEeWUc8x5aVek93lIMpTnry1GbDelGtGmOxs0Jj43N4YeW3qZKvmY0cKZDONAtqUX29zqr1/+GJeT8jVOJpF94imBegKPywf6CHQ+wPjtJ29jc9WIuRX7Dr/+JLjwPncuIRlhQC/2CWLjvvX+OVIr4zAwkSDw0J5/twetpJ4/H2BXVb/LiKgWl36VqDMHIVoF8Wy7DtiDvezmQvjttRxUwVLrHCPBk=' | sudo tee /home/ansibleadmin/.ssh/authorized_keys"
      #   "sudo apt update",
      #   "sudo apt install jq unzip -y",
      #   "sudo sed -i '/<h1>Welcome.*/a <h1>${var.vpc_name}-PublicServer-${count.index + 1}</h1>' /var/www/html/index.nginx-debian.html"

    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("DevOps.pem")
      #host     = "${aws_instance.web-1.public_ip}"
      host = element(aws_instance.web-1.*.public_ip, count.index)
    }
  }
}




