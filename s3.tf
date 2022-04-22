resource "aws_s3_bucket" "tf-state-bin-poc" {
    bucket = "tf-state-bin-poc"

    tags = {
        Name = "tf-state-bin-poc"
        Env = "Dev"
  }
}

