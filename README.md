# Terraform AWS Examples

### Examples

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