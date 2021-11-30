variable "tags" {
    description = "tags for s3 resources attached"
    type        = map(string)
}


variable "account_id" {
    description = "aws account id"
    type        = string

}


variable "user_id" {
    description = "aws user id"
    type        = string

}