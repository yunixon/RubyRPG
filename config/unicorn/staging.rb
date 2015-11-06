# paths
app_path = "/home/deploy/apps/staging_ruby_mmo_maker/current"
shared = "/home/deploy/apps/staging_ruby_mmo_maker/shared"
working_directory app_path
pid "#{shared}/tmp/pids/unicorn.pid"

# listen
listen "#{shared}/tmp/sockets/unicorn_staging.sock", backlog: 512

# workers
worker_processes 2

# logging
stderr_path "#{shared}/log/unicorn.stderr.log"
stdout_path "#{shared}/log/unicorn.stdout.log"

# use correct Gemfile on restarts
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/Gemfile"
end
preload_app true
timeout 60

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end
