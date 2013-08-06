require 'desk/connection'
require 'desk/api/cases'
require 'desk/api/articles'

module Desk
  class Client
    include Desk::Api::Cases
    include Desk::Api::Articles

    def initialize(opts={})
      @opts = opts
    end

    private

    def connection
      @connection ||= Desk::Connection.new(@opts)
    end

  end
end