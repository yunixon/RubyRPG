module Rpg
	module V1
		class BaseApi < Grape::API
			include Rpg::V1::Defaults

			helpers do
		    def authenticate!
		      error!('Unauthorized. Invalid or expired token.', 401) unless current_user
		    end

	    	def current_user
	      	# find token. Check if valid.
		      token = ApiKey.where(access_token: params[:token]).first
		      if token && !token.expired?
		        @current_user = User.find(token.user_id)
		      else
		        false
		      end
	    	end

	    	params :token do
			    requires :token, type: String, desc: "Access token."
	    	end
			end

			# Seperate the API into smaller files
			mount Rpg::V1::PlayerInfo => '/player'
			mount Rpg::V1::RaceInfo => '/raceinfo'
			mount Rpg::V1::VirtueInfo => '/virtueinfo'
			mount Rpg::V1::Dice => '/dice'

			# /api/auth
			resource :auth do
		  	desc 'Creates and returns access_token if valid login'
			  params do
			    requires :login, type: String, desc: 'Username or email address'
			    requires :password, type: String, desc: 'Password'
			  end

			  post :login do
			    if params[:login].include?('@')
			      user = User.find_by_email(params[:login].downcase)
			    else
			    	# TODO Fix user_name to be downcase by default
			    	# Monkey patched for now & will only work if
			    	# username is already downcase or has 1 capital letter
			      user = User.find_by_login(params[:login].downcase && params[:login].capitalize)
			    end

			    if user && user.valid_password?(params[:password])
			      key = ApiKey.create(user_id: user.id)
			      {token: key.access_token}
			    else
			      error!('Unauthorized.', 401)
			    end
			  end

			  desc 'Returns pong if logged in correctly'
			  params do
			  	use :token
			  end
			  get :ping do
			    authenticate!
			    { message: "pong" }
			  end
			end
		end
	end
end
