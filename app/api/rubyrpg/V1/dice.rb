#require '/app/services/dice_service'

module Rubyrpg
  module V1
  	class Dice < Grape::API
      include Rubyrpg::V1::Defaults

  		desc 'Returns an initiative roll'
  		get :roll do
  			dice = DiceService.new(1, 20)
  			dice.roll
  		end
    end
	end
end
