set :stage, :staging
set :rails_env, :staging
set :branch, 'staging-env'

set :full_app_name, 'staging_ruby_mmo_maker'

role :app, %w{deploy@188.227.75.14}
role :web, %w{deploy@188.227.75.14}

set :sidekiq_role, :app
set :sidekiq_config, "#{shared_path}/config/sidekiq.yml"
set :sidekiq_env, :staging

set :deploy_to, "/home/deploy/apps/#{fetch(:full_app_name)}"

server '188.227.75.14', user: 'deploy', roles: %w{web app db worker}

namespace :deploy do
  task :setup_config do
    on roles(:all) do
      sudo "ln -nfs #{shared_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:full_app_name)}"
      sudo "ln -nfs #{shared_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:full_app_name)}"
      sudo "ln -nfs #{shared_path}/config/sidekiq_#{fetch(:full_app_name)}.conf /etc/init/sidekiq_#{fetch(:full_app_name)}.conf"
    end
  end
end
