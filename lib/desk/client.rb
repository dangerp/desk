require 'desk/connection'
require 'desk/api/cases'
require 'desk/api/articles'
require 'desk/api/translations'
require 'desk/api/customers'
require 'desk/api/topics'
require 'desk/api/groups'
require 'desk/api/brands'
require 'desk/api/companies'
require 'desk/api/custom_fields'
require 'desk/api/facebook_users'
require 'desk/api/filters'

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

    def brands
      Desk::Api::Brands.new(connection)
    end

    def companies
      Desk::Api::Brands.new(connection)
    end

    def custom_fields
      Desk::Api::CustomFields.new(connection)
    end

    def facebook_users
      Desk::Api::FacebookUsers.new(connection)
    end

    def filters
      Desk::Api::Filters.new(connection)
    end

    private

    def connection
      @connection ||= Desk::Connection.new(@opts)
    end

  end
end