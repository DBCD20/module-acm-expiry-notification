<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_sns_topic.acm_approaching_expiry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy resources in | `string` | `"us-east-1"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_notification_email"></a> [notification\_email](#input\_notification\_email) | Email address to receive notifications for ACM near expiry events | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_approaching_expiry_notification_email"></a> [acm\_approaching\_expiry\_notification\_email](#output\_acm\_approaching\_expiry\_notification\_email) | Email address to receive notifications for ACM near expiry events |
<!-- END_TF_DOCS -->