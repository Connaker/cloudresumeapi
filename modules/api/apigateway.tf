#
#                 API GATEWAY RESOURCES
#     Creates API Gateway, resource, method, integration
#           and deployment with Lambda resource
#



resource "aws_api_gateway_rest_api" "my_api" {
  name = var.api_name
}

resource "aws_api_gateway_resource" "api_resource" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  parent_id   = aws_api_gateway_rest_api.my_api.root_resource_id
  path_part   = var.api_path_part
}

resource "aws_api_gateway_method" "api_method" {
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  resource_id   = aws_api_gateway_resource.api_resource.id
  http_method   = var.http_method
  authorization = var.authorization
}

resource "aws_api_gateway_integration" "api_integration" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.api_resource.id
  http_method = aws_api_gateway_method.api_method.http_method

  integration_http_method = var.integration_http_method
  type                    = var.api_integration_type
  uri                     = var.api_integration_uri
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  depends_on  = [aws_api_gateway_integration.api_integration]
}
