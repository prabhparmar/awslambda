resource "aws_s3_bucket" "lifecycle-time" {
  bucket = "lifecycle-time"
  acl    = "private"
  lifecycle_rule {
  
    id      = "lily"
    enabled = true

    prefix = "lily/"

    # tags {
    #   rule = "archive"
    # }

    transition {
      days          = 1
      storage_class = "GLACIER"
    }

    expiration {
      days = 2
    }
  }


}


resource "aws_s3_bucket_object" "lifecycle-time-lily" {
  bucket = "${aws_s3_bucket.lifecycle-prabh1.id}"
  acl    = "private"
  key    = "lily/"
  source = "/dev/null"
}