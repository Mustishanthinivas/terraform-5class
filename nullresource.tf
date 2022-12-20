resource "null_resource" "execute" {
  count = var.env == "prod" ? 3 : 1
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("laptopkey.pem")
      host        = element(aws_instance.public-servers.*.public_ip, count.index)
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /bin/bash /tmp/script.sh > /tmp/output.txt",
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("laptopkey.pem")
      host        = element(aws_instance.public-servers.*.public_ip, count.index)
    }
  }
}