require 'grape-swagger'

class API < Grape::API
  # Mount RubyRPG API
  mount Rpg::V1::BaseApi => '/rpg/v1'

  # Mount the swagger docs
  add_swagger_documentation(
    base_path: "/api",
    hide_documentation_path: false,
    hide_format: false
  )
end

