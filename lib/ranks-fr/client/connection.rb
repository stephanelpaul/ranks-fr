require 'faraday_middleware'

module RanksFr
  class Client
    module Connection
      private

      def connection(options={})
        url = options.fetch(:endpoint, endpoint)
        
        @connection ||= Faraday.new(:url => url) do |builder|
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::RaiseError
          builder.use Faraday::Response::ParseXml
          builder.adapter(Faraday.default_adapter)
        end
      end

    end
  end
end
