provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

// AWS Cloud Watch Configuration
resource "aws_cloudwatch_metric_alarm" "ses-reputation-bounce-rate" {
  alarm_name                = "ses-reputation-bounce-rate"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "Reputation.BounceRate"
  namespace                 = "AWS/SES"
  threshold                 = "0.05"
  period = 3600
  statistic = "Average"
  alarm_description         = "This metric monitors ses reputation bounce rate"
  alarm_actions = [aws_sns_topic.ses-cloud-watch.arn]
}

resource "aws_cloudwatch_metric_alarm" "ses-reputation-complaint-rate" {
  alarm_name                = "ses-reputation-complaint-rate"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "Reputation.ComplaintRate"
  namespace                 = "AWS/SES"
  threshold                 = "0.001"
  period = 3600
  statistic = "Average"
  alarm_description         = "This metric monitors ses reputation complaint rate"
  alarm_actions = [aws_sns_topic.ses-cloud-watch.arn]
}

// AWS Simple Email Service Configuration
resource "aws_sns_topic" "ses-cloud-watch" {
  name = "ses-cloud-watch"
}

resource "aws_sns_topic_subscription" "ses-cloud-watch-subscription" {
  endpoint = "https://example.com/myroute"
  protocol = "https"
  topic_arn = aws_sns_topic.ses-cloud-watch.arn
  endpoint_auto_confirms = true
}
