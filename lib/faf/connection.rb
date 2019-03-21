module Faf
  class Connection
    class << self
      attr_reader :instance

      def initialize!(token, options = {})
        @instance ||= new(token, options)
      end

      def reset!
        @instance = nil
      end

      def query(query, options = {})
        raise 'Not Initialized' unless instance
        instance.query(query, options)
      end
    end

    attr_reader :token

    def initialize(token, _options = {})
      @token = token
    end

    def query(query, options)
      graphql_client.query(query, options)
    end

    private

    def graphql_client
      @graphql_client ||= Graphlient::Client.new(
        'https://api.github.com/graphql',
        headers: {
          'Authorization' => "Bearer #{token}",
          'Content-Type' => 'application/json'
        }
      )
    end
  end
end
