require 'desk/connection'
require 'desk/api/cases'
require 'desk/api/articles'
require 'desk/api/translations'
require 'desk/api/customers'
require 'desk/api/topics'
require 'desk/api/groups'

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

    def customers
      Desk::Api::Customers.new(connection)
    end

    def topics
      Desk::Api::Topics.new(connection)
    end

    private

    def connection
      @connection ||= Desk::Connection.new(@opts)
    end

  end
end