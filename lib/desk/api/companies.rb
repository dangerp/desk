# require 'active_support/core_ext/hash'
require 'desk/api/modules/listable'
require 'desk/api/modules/creatable'
require 'desk/api/modules/searchable'
require 'desk/company'

module Desk
  module Api
    class Companies

      include Desk::Api::Listable
      include Desk::Api::Creatable
      include Desk::Api::Searchable

      VALID_SEARCH_PARAMS= [:q]

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "companies"
        @return_class = Desk::Company
      end

      def cases(id)
        Desk::Collection.new(connection.get("companies/#{id}/cases"), Desk::Case)
      end

      private

      def valid_search_params
        VALID_SEARCH_PARAMS
      end
    end
  end
end