provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  profile                 = "default"
}

output "regionname"{
    value = "${var.region}"
}
output "SampelString"{
    value = "Hello World!"
}

