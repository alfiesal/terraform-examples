# Terraform AWS Examples

#### SES - Simple Email Service

###### `transactional_and_marketing_sets_with_ses`

Requirements
- email identity
- two configurations sets for sending marketing and transactional emails. 
- event destination listening on `send`, `reject`, `bounce`, `complaint`, `delivery`, `open`, `click`
- SNS topic as event destination, with http/https subscription

