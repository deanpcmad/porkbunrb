require "test_helper"

class ConfigurationTest < Minitest::Test

  def setup
    Porkbun.config.api_key = "abc123"
    Porkbun.config.api_secret = "def456"
  end

  def test_api_key
    assert_equal "abc123", Porkbun.config.api_key
  end

  def test_api_secret
    assert_equal "def456", Porkbun.config.api_secret
  end

end
