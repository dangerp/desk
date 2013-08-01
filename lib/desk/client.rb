require 'desk/connection'
require 'desk/api/cases'

module Desk
  class Client
    include Desk::Api::Cases

    def initialize(opts={})
      @opts = opts
    end

    private

    def connection
      @connection ||= Desk::Connection.new(@opts)
    end

  end
end