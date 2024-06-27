# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"

 
}

# setting up a backend to store the state file 
#terraform {
 # backend "s3" {
  #  bucket = "myj-mini-bucket1"
   # key    = "terraform/state"
    #region = "us-east-2"
#  }
#}
