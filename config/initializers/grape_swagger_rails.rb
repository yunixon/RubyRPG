GrapeSwaggerRails.options.url      = 'api/swagger_doc'
GrapeSwaggerRails.options.app_name = 'RubyRPG'
GrapeSwaggerRails.options.app_url  = '/'
GrapeSwaggerRails.options.api_key_name = 'api_token'
GrapeSwaggerRails.options.api_key_type = 'query'

GrapeSwaggerRails.options.before_filter do |request|
  # 1. Inspect the `request` or access the Swagger UI controller via `self`.
  # 2. Check `current_user` or `can? :access, :api`, etc.
  # 3. Redirect or error in case of failure.
  redirect_to '/' unless current_user
end
