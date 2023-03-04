resource "aws_s3_bucket" "aloshari" {
  bucket = "aloshari-bucket" //Replace with your desired bucket name

  
  tags = {
    Name = "Hassan Bucket"
  }
}
