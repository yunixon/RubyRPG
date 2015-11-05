APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

ActionMailer::Base.smtp_settings = {
  user_name: APP_CONFIG['smtp_data']['user_name'],
  password: APP_CONFIG['smtp_data']['password'],
  domain: APP_CONFIG['smtp_data']['domain'],
  address: APP_CONFIG['smtp_data']['address'],
  port: APP_CONFIG['smtp_data']['port'],
  authentication: APP_CONFIG['smtp_data']['authentication'],
  enable_starttls_auto: APP_CONFIG['smtp_data']['tls']
}
