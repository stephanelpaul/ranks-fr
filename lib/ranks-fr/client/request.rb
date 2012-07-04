require 'uuid'

module RanksFr
  class Client
    module Request
      def uid
        @uid || UUID.new.generate(:compact)
      end

      def get(path, options = {})
        options[:apikey] = apikey
        options[:endpoint] = endpoint
        options[:format] = format

        request(:get, path, options)
      end

      def request(method, path, options)
        response = connection.send(method) do |request|
          request.url(path, options)
        end
        response.body
      end
    end
  end
end
