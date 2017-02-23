CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
  else
    config.storage = :file
  end
end