module Rpg
  module V1
    class UserInfo < Grape::API
      include Rpg::V1::Defaults

      desc 'My players'
      get :players do
        current_user.players
      end
    end
  end
end
