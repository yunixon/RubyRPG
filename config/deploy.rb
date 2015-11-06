# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'ruby_mmo_maker'
set :repo_url, 'git@github.com:yunixon/RubyRPG.git'
set :user, 'deploy'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/apps/#{fetch(:application)}"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, false

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/config.yml', 'config/sidekiq.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

set :sidekiq_config, -> { File.join(shared_path, 'config', 'sidekiq.yml') }

namespace :deploy do
  task :setup_config do
    on roles(:all) do
      #sudo "ln -nfs #{shared_path}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      #sudo "ln -nfs #{shared_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
      sudo "ln -nfs #{shared_path}/config/sidekiq_#{fetch(:application)}.conf /etc/init/sidekiq_#{fetch(:application)}.conf"
    end
    #run "mkdir -p #{shared_path}/config"
    #put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    #puts "Now edit #{shared_path}/config/database.yml and add your username and password"
  end

  task :restart do
    invoke 'unicorn:restart'
  end

  after :publishing, :restart
  after :finishing,  :cleanup
end
