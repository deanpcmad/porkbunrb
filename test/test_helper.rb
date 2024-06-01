$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "porkbun"

require "minitest/autorun"
require "faraday"
require "json"
require "vcr"
require "dotenv/load"

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :faraday

  config.filter_sensitive_data("<API_KEY>") { ENV["PORKBUN_API_KEY"] }
  config.filter_sensitive_data("<API_SECRET>") { ENV["PORKBUN_API_SECRET"] }
end

Porkbun.configure do |config|
  config.api_key = ENV["PORKBUN_API_KEY"]
  config.api_secret = ENV["PORKBUN_API_SECRET"]
end

class Minitest::Test

  def setup
    VCR.insert_cassette(name)
  end

  def teardown
    VCR.eject_cassette
  end

end
