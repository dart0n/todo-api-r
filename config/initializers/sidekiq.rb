Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') { Rails.application.credentials.dig(:redis, :db) } }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') { Rails.application.credentials.dig(:redis, :db) } }
end
