resource "aws_api_gateway_rest_api" "myapi" {
  name        = "MyAPI"
  description = "This is my API"
}

resource "aws_api_gateway_resource" "myresource" {
  rest_api_id = aws_api_gateway_rest_api.myapi.id
  parent_id   = aws_api_gateway_rest_api.myapi.root_resource_id
  path_part   = "myresource"
}

resource "aws_api_gateway_method" "mymethod" {
  rest_api_id   = aws_api_gateway_rest_api.myapi.id
  resource_id   = aws_api_gateway_resource.myresource.id
  http_method   = "GET"
  authorization = "NONE"
}
