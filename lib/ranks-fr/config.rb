require 'ranks_fr/version'

module RanksFr
  class Config
    DEFAULT_API_KEY = nil
    DEFAULT_API_ENDPOINT = "http://www.ranks.fr/api/v2/" 
    DEFAULT_FORMAT = 'XML'

    VALID_OPTIONS_KEYS = [
      :apikey,
      :endpoint, 
      :format
    ]

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extend(base)
      base.reset
    end

    def configure
      yield self
      self
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each do |k|
        options[k] = send(k)
      end
      options
    end

    def reset
      self.apikey = DEFAULT_API_KEY
      self.endpoint = DEFAULT_API_ENDPOINT
      self.format = DEFAULT_FORMAT
    end

  end
end
