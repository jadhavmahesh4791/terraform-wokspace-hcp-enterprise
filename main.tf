# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" # Specify your desired region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-tf-enterprise-bucket"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Production"
  }
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket-1" {
  bucket = "my-tf-enterprise-bucket-1"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Production"
  }
}
