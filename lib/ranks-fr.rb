require 'ranks_fr/client'
require 'ranks_fr/config'

module RanksFr
  class << self

    def new(options={})

    end

    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(metod, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(metod, include_private)
    end
  end
end
