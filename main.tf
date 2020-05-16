# Common change for tf12 .. remove $ and double quotes for  all veriable interpolations
provider "aws" {
   region = var.region
   access_key = "AKIAIUMEXZLIS57XW4XA"
   secret_access = "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"
}

terraform {
  backend "s3" {
    bucket = "cloudzenixtfstatefiles03012020"
    #key    = "tfstatefiles/terraform.tfstate"
    key    = "project1/terraform.tfstate"
    region = "us-east-2"
  }
}

resource "aws_instance" "cZServers" {
  #ami = "ami-5e8bb23b"
  ami = "ami-5e8bb23b"
  instance_type = "t2.micro"
  count = var.instance_count
  vpc_security_group_ids = ["${var.security_group}"]

  key_name = var.key_name
  
  user_data = file("user-data.txt")
  #Changed for tf12
  tags = {
    Name = "My-terraformInst--${count.index + 1}"
  }

}

output "public_ip" {
#value = "${aws_instance.cZServers.public_ip}"
  value = "${formatlist("%v", aws_instance.cZServers.*.public_ip)}"
}

resource "null_resource" "myPublicIps" {
count = var.instance_count
provisioner "local-exec" {
      command = "echo '${element(aws_instance.cZServers.*.public_ip, count.index)}' >> hosts1"
}
}
