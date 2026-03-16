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

data "aws_iam_policy_document" "allow_access" {
  statement {
    sid    = "AllowSpecificAccount"
    effect = "Allow"

    # Define who can access the bucket
    principals {
      type        = "AWS"
      identifiers = ["230609304704"] # Replace with real Account ID or IAM Role ARN
    }

    # Define allowed actions
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    # Define the resources (Bucket itself and all objects inside)
    resources = [
      aws_s3_bucket.my_bucket.arn,
      "${aws_s3_bucket.my_bucket.arn}/*"
    ]
  }
}
