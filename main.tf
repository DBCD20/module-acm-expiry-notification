resource "aws_cloudwatch_event_rule" "this" {
  name        = "capture-acm-near-expiry-events"
  description = "Capture all ACM near expiry events"

  event_pattern = jsonencode({
    source      = ["aws.acm"]
    detail-type = ["ACM Certificate Approaching Expiration"]
  })
}

resource "aws_cloudwatch_event_target" "this" {
  rule = aws_cloudwatch_event_rule.this.name
  arn  = aws_sns_topic.acm_approaching_expiry.arn

  depends_on = [aws_sns_topic.acm_approaching_expiry]
}

resource "aws_sns_topic" "acm_approaching_expiry" {
  name              = "acm-approaching-expiry-topic"
  kms_master_key_id = var.sns_cmk_id
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn = aws_sns_topic.acm_approaching_expiry.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

resource "aws_cloudwatch_event_permission" "this" {
  principal = "sns.amazonaws.com"
  action    = "events:PutEvents"
  statement_id = "AllowSNSPublishToEventRule"

  condition {
    test     = "StringEquals"
    variable = "aws:SourceArn"
    values   = [aws_sns_topic.acm_approaching_expiry.arn]
  }
}

resource "aws_sns_topic_policy" "sns_event_rule_policy" {
  arn    = aws_sns_topic.acm_approaching_expiry.arn
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "SNS:Publish"
        Resource  = aws_sns_topic.acm_approaching_expiry.arn
      }
    ]
  })
}

resource "aws_iam_role" "sns_event_rule_role" {
  name = "sns_event_rule_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sns_event_rule_policy" {
  role       = aws_iam_role.sns_event_rule_role.name
  policy_arn = aws_iam_policy.sns_event_rule_policy.arn
}
