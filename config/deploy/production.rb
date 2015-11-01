set :stage, :production
set :rails_env, :production
set :branch, :master

set :deploy_to, "home/#{fetch(:user)}/apps/#{fetch(:application)}"

server '188.227.75.14', user: 'deploy', roles: %w{web app db worker}
