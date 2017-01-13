CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:                'AWS',
    aws_access_key_id:       ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key:   ENV["AWS_SECRET_ACCESS_KEY"],
    region:                  'ap-northeast-1'
  }

  case Rails.env
    when 'development'
      config.storage :fog
      config.cache_storage = :fog
      config.fog_directory = 'chat-image'
      config.asset_host = 'https://chat-image.s3.amazonaws.com'

    when 'test'
      config.storage :file

    when 'production'
      config.storage :fog
      config.cache_storage = :fog
      config.fog_directory = 'chat-image'
      config.asset_host = 'https://chat-image.s3.amazonaws.com'
  end
end
