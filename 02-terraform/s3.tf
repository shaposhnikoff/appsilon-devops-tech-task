#resource "aws_s3_bucket" "terraform_state" {
#  bucket = "shini-terraform-state"  
#  # state files
#  versioning {
#    enabled = true
#  }  # Enable server-side encryption by default
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        sse_algorithm = "AES256"
#      }
#    }
#  }
#}

#resource "aws_dynamodb_table" "terraform_locks" {
#  name         = "shini-terraform-locks"
#  billing_mode = "PAY_PER_REQUEST"
#  hash_key     = "LockID"  
#  attribute {
#    name = "LockID"
#    type = "S"
#  }
#}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "shini-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "shini-terraform-locks"
    encrypt        = true
  }
}


