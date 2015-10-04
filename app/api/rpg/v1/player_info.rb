module Rpg
	module V1
		class PlayerInfo < Grape::API
			include Rpg::V1::Defaults

			# Helps find a player the user is playing by name
			#
			#   current_player("John")
			#      => { player_id: 23, name: "John" }
			helpers do
				def current_player(player_name)
					@current_player = current_user.players.find_by(name: player_name)
				end
			end

			desc 'Create a player'
			params do
				requires :name, type: String, desc: 'Player Name'
			end
			post :create do
				Player.create!({
					user_id: current_user.id,
					name: params[:name]
				})
			end

			desc 'Delete a player'
			params do
				requires :name, type: String, desc: 'Player Name'
			end

			post :delete do
				player = current_player(params[:name])
				if player.nil?
					{ deleted: false}
				else
					{ deleted: true}
					player.destroy
				end
			end

			desc 'Current player'
			params do
				requires :name, type: String, desc: 'Player Name'
			end
			get :current_player do
				current_player(params[:name])
			end
		end
	end
end
