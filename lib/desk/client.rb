require 'desk/connection'
require 'desk/api/cases'
require 'desk/api/articles'
require 'desk/api/translations'

module Desk
  class Client
    include Desk::Api::Cases

    def initialize(opts={})
      @opts = opts
    end

    def articles
      Desk::Api::Articles.new(connection)
    end

    private

    def connection
      @connection ||= Desk::Connection.new(@opts)
    end

  end
end