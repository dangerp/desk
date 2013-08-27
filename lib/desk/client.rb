require 'desk/connection'
require 'desk/api/cases'
require 'desk/api/articles'
require 'desk/api/translations'

module Desk
  class Client

    def initialize(opts={})
      @opts = opts
    end

    def articles
      Desk::Api::Articles.new(connection)
    end

    def cases
      Desk::Api::Cases.new(connection)
    end

    private

    def connection
      @connection ||= Desk::Connection.new(@opts)
    end

  end
end