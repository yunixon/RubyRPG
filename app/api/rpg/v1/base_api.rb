module Rpg
	module V1
		class BaseApi < Grape::API
			include Rpg::V1::Defaults

			# Seperate the API into smaller files
			mount Rpg::V1::UserInfo => '/me'
			mount Rpg::V1::PlayerInfo => '/player'
			mount Rpg::V1::RaceInfo => '/raceinfo'
			mount Rpg::V1::VirtueInfo => '/virtueinfo'
			mount Rpg::V1::Dice => '/dice'
		end
	end
end
