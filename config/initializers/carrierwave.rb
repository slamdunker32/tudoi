CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
    config.cache_dir = '/tmp'
  end
  