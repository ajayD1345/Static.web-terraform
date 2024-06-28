resource "aws_api_gateway_integration" "mock_integration" {
  rest_api_id = aws_api_gateway_rest_api.myapi.id
  resource_id = aws_api_gateway_resource.myresource.id
  http_method = aws_api_gateway_method.mymethod.http_method

  type = "MOCK"
  
  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.myapi.id
  resource_id = aws_api_gateway_resource.myresource.id
  http_method = aws_api_gateway_method.mymethod.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "integration_response_200" {
  rest_api_id         = aws_api_gateway_rest_api.myapi.id
  resource_id         = aws_api_gateway_resource.myresource.id
  http_method         = aws_api_gateway_method.mymethod.http_method
  status_code         = aws_api_gateway_method_response.response_200.status_code
  selection_pattern   = ""
  response_templates = {
    "application/json" = "{\"message\":\"This is a mock integration response\"}"
  }
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on  = [aws_api_gateway_integration.mock_integration]
  rest_api_id = aws_api_gateway_rest_api.myapi.id
  stage_name  = "prod"
}
