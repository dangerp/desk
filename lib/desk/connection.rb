require 'faraday_middleware'

module Desk
  class Connection

    def initialize(opts={})
      @site = opts[:site]
      connection
      use_basic_auth(opts) if opts[:email] && opts[:password]
      use_oauth(opts) if opts[:consumer_key] &&
                         opts[:consumer_secret] &&
                         opts[:token] &&
                         opts[:token_secret]
    end

    def get(*opts)
      @connection.get(*opts).body
    end

    private

    def connection
      @connection ||= Faraday.new(base_url, ssl: { verify: true } ) do |conn|
        conn.use FaradayMiddleware::ParseJson
        conn.headers = {'Accept' => 'application/json'}
        conn.use Faraday::Adapter::NetHttp
      end
      @connection
    end

    def use_basic_auth(opts)
      @connection.builder.insert(1, Faraday::Request::BasicAuthentication, opts[:email], opts[:password])
    end

    def use_oauth(opts)
      @connection.builder.insert(1, FaradayMiddleware::OAuth, {
                          :consumer_key => opts[:consumer_key],
                          :consumer_secret => opts[:consumer_secret],
                          :token => opts[:token],
                          :token_secret => opts[:token_secret]
                        } )
    end

    def base_url
      "https://#{@site}.desk.com/api/v2/"
    end
  end
end
