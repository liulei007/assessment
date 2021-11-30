resource "aws_s3_bucket" "main_bucket" {
  bucket = var.tags["Name"]
  acl = "private"
  tags = {
      client         = var.tags["client"]
      environment    = var.tags["environment"]
      
  }
}

resource "aws_s3_bucket_policy" "main_bucket" {
bucket = aws_s3_bucket.main_bucket.id
policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": ["arn:aws:iam::${var.account_id}:user/${var.user_id}"]
            },
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.main_bucket.id}"
            ]
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": ["arn:aws:iam::${var.account_id}:user/${var.user_id}"]
            },
            "Action": [
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource":[
                "arn:aws:s3:::${aws_s3_bucket.main_bucket.id}/*"
            ]
        }
    ]
}
EOF

}


output "main_bucket" {
    value = aws_s3_bucket.main_bucket.id
}

output "tags"{
    value = var.tags
}
