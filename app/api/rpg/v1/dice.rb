#require '/app/services/dice_service'

module Rpg
  module V1
  	class Dice < Grape::API
      include Rpg::V1::Defaults

  		desc 'Returns an initiative roll'
  		get :roll do
  			dice = DiceService.new(1, 20)
  			dice.roll
  		end
    end
	end
end
