
#
# Zip the main.py 
#


data "archive_file" "zip" {  
  type = "zip"  
  source_file = "./main.py"
  output_path = "./main.zip"
}

#
# AWS IAM POLICY DOCUMENT INFORMATION
#

data "aws_iam_policy_document" "lambda-policy-doc" {
  statement {
    sid    = "AllowInvokingLambdas"
    effect = "Allow"

    resources = [
      "arn:aws:lambda:*:*:function:*"
    ]

    actions = [
      "lambda:InvokeFunction"
    ]
  }

  statement {
    sid    = "AllowCreatingLogGroups"
    effect = "Allow"

    resources = [
      "arn:aws:logs:*:*:*"
    ]

    actions = [
      "logs:CreateLogGroup"
    ]
  }
  statement {
    sid    = "AllowWritingLogs"
    effect = "Allow"

    resources = [
      "arn:aws:logs:*:*:log-group:/aws/lambda/*:*"
    ]

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
  }
  statement {
    sid    = "AllowEC2"
    effect = "Allow"

    resources = [
      "*"
    ]

    actions = [
      "ec2:Describe*"
    ]
  }
}