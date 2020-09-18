provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

// AWS Simple Email Service Configuration
resource "aws_ses_configuration_set" "transactional" {
  name = "Transactional"
}

resource "aws_ses_configuration_set" "marketing" {
  name = "Marketing"
}

resource "aws_ses_email_identity" "ses_email_sender" {
  email = "salomonsalfie@gmail.com"
}

resource "aws_ses_event_destination" "transactional-event-destination" {
  name                   = "transactional-event-sns"
  configuration_set_name = aws_ses_configuration_set.transactional.name
  enabled                = true
  matching_types         = ["send", "reject", "bounce", "complaint", "delivery", "open", "click"]

  sns_destination {
    topic_arn = aws_sns_topic.ses-events.arn
  }
}

resource "aws_ses_event_destination" "marketing-event-destination" {
  name                   = "marketing-event-sns"
  configuration_set_name = aws_ses_configuration_set.marketing.name
  enabled                = true
  matching_types         = ["send", "reject", "bounce", "complaint", "delivery", "open", "click"]

  sns_destination {
    topic_arn = aws_sns_topic.ses-events.arn
  }
}

// AWS Simple Notification Service Configuration

resource "aws_sns_topic" "ses-events" {
  name = "ses-events"
}

resource "aws_sns_topic_subscription" "sns-events-subscription" {
  endpoint = "https://example.com/myroute"
  protocol = "https"
  topic_arn = aws_sns_topic.ses-events.arn
  endpoint_auto_confirms = true
}