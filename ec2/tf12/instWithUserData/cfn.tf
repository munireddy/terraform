# Common change for tf12 .. remove $ and double quotes for  all veriable interpolations
provider "aws" {
   region = var.region
}

resource "aws_cloudformation_stack" "TF-From-CFN" {
  name = "Muni-TF-From-CFN"

  template_url = "https://cf-templatemuni01.s3.us-east-2.amazonaws.com/cfn-json-yaml1.yaml"

}


