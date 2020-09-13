resource "aws_sns_topic" "sns-events" {
  name = "sns-events"
}

resource "aws_sns_topic_subscription" "sns-events-subscription" {
  endpoint = "https://example.com/myroute"
  protocol = "https"
  topic_arn = aws_sns_topic.sns-events.arn
  endpoint_auto_confirms = true
}