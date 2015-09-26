require 'grape-swagger'

class API < Grape::API
  #prefix :api
  #version 'v1', using: :path

  # Mount RubyRPG API
  mount Rubyrpg::V1::BaseApi => '/rubyrpg/v1'

  # Mount the swagger docs
  add_swagger_documentation(
    base_path: "/api",
    #api_version: 'v1',
    hide_documentation_path: false,
    hide_format: false
  )
end

