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
  name                   = "transactional-event-destination-sns"
  configuration_set_name = aws_ses_configuration_set.transactional.name
  enabled                = true
  matching_types         = ["send", "reject", "bounce", "complaint", "delivery", "open", "click"]

  sns_destination {
    topic_arn = aws_sns_topic.sns-events.arn
  }
}

resource "aws_ses_event_destination" "marketing-event-destination" {
  name                   = "marketing-event-destination-sns"
  configuration_set_name = aws_ses_configuration_set.marketing.name
  enabled                = true
  matching_types         = ["send", "reject", "bounce", "complaint", "delivery", "open", "click"]

  sns_destination {
    topic_arn = aws_sns_topic.sns-events.arn
  }
}



