set :stage, :production
set :rails_env, :production
set :branch, :master

role :app, %w{deploy@188.227.75.14}
role :web, %w{deploy@188.227.75.14}

set :sidekiq_role, :app
set :sidekiq_config, "#{shared_path}/config/sidekiq.yml"
set :sidekiq_env, :production

set :deploy_to, "/home/deploy/apps/#{fetch(:application)}"

server '188.227.75.14', user: 'deploy', roles: %w{web app db worker}
