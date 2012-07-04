require 'ranks_fr/config'
require 'ranks_fr/client/connection'
require 'ranks_fr/client/request'

module RanksFr
  class Client
    include RanksFr::Client::Connection
    include RanksFr::Client::Request


    attr_accessor *Config::VALID_OPTIONS_KEYS

    def initialize(attrs={})
      RanksFr.reset
      attrs = RanksFr.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |k|
        instance_variable_set("@#{k}".to_sym, attrs[k])
      end
    end

  end
end
