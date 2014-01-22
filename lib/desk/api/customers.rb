require 'desk/api/modules/listable'
require 'desk/api/modules/creatable'
require 'desk/api/modules/searchable'
require 'desk/customer'

module Desk
  module Api
    class Customers

      include Desk::Api::Listable
      include Desk::Api::Creatable
      include Desk::Api::Searchable

      VALID_SEARCH_PARAMS = [:first_name, :last_name, :full_name, :email, :since_created_at,
                             :max_created_at, :external_id, :since_updated_at, :max_updated_at,
                             :since_id, :max_id, :twitter, :phone, :custom_N]

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "customers"
        @return_class = Desk::Customer
      end

      private

      def valid_search_params
        VALID_SEARCH_PARAMS
      end
    end
  end
end