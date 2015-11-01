uri = URI.parse(APP_CONFIG['REDIS_URL'])
REDIS = Redis.new(url: uri)
