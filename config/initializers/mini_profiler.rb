# Fixes "Model 'Mini-profiler-resources' could not be found" bug when
# in development mode using Rails Admin
if Rails.env == 'development'
  require 'rack-mini-profiler'

  # initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)
  Rack::MiniProfiler.config.start_hidden = true
  Rack::MiniProfiler.config.skip_paths ||= []
  Rack::MiniProfiler.config.skip_paths << '/admin'
end
