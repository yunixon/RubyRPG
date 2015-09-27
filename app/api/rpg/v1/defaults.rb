module Rpg
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        default_format :json
        format :json
        #formatter :json,
        #  Grape::Formatter::ActiveModelSerializers

        before do
          error!('401 Unauthorized', 401) unless authenticated?
        end

        helpers do
          #def permitted_params
          #  @permitted_params ||= declared(params, include_missing: false)
          #end

          def warden
            env['warden']
          end

          def authenticated?
            return true if warden.authenticated?
            params[:api_token] && @user = User.find_by_api_token(params[:api_token])
          end

          def current_user
            warden.user || @user
          end

          def logger
            Rails.logger
          end
        end

        # global exception handler, used for error notifications
        rescue_from :all do |e|
          if Rails.env.development?
            raise e
          else
            Raven.capture_exception(e)
            error_response(message: 'Internal server error', status: 500)
          end
        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          error_response(message: e.message, status: 422)
        end
      end
    end
  end
end
