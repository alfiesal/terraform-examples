# Terraform AWS Examples

### Examples

#### Claud Watch

###### `ses-reputation-complaints-alarms`

Requirements
- send notification when complaint rate is higher than 0.1%
- send notification when bounce rate is higher than 5%

#### SES - Simple Email Service

###### `transactional_and_marketing_sets_with_ses`

Requirements
- email identity
- two configurations sets for sending marketing and transactional emails. 
- event destination listening on `send`, `reject`, `bounce`, `complaint`, `delivery`, `open`, `click`
- SNS topic as event destination, with http/https subscription

### Tutorials

- https://www.hashicorp.com/resources/terraform-repository-best-practices
- https://medium.com/@dav009/terraform-sane-practices-project-structure-c4347c1bc0f1