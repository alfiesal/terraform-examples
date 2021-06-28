variable "aws_region" {
  type        = string
  description = "AWS Region where application should be deployed"
  default     = "eu-central-1"
}

variable "iam_users" {
  type        = list(string)
  description = "User list"
  default     = ["alfie.salomons", "terry.richardson", "ricky.miller", "robin.kelly"]
}

variable "iam_groups" {
  type        = list(string)
  description = "Group list"
  default     = ["administrators", "developers", "support"]
}
