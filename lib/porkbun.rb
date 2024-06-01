require "faraday"

require_relative "porkbun/version"

module Porkbun

  autoload :Configuration, "porkbun/configuration"
  autoload :Client, "porkbun/client"
  autoload :Collection, "porkbun/collection"
  autoload :Error, "porkbun/error"
  autoload :Object, "porkbun/object"

  class << self
    attr_writer :config
  end

  def self.configure
    yield(config) if block_given?
  end

  def self.config
    @config ||= Porkbun::Configuration.new
  end

  autoload :Domain, "porkbun/models/domain"
  autoload :Record, "porkbun/models/record"
  autoload :NameServer, "porkbun/models/name_server"

end
