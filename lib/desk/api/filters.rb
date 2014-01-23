require 'desk/api/modules/listable'
require 'desk/filter'

module Desk
  module Api
    class Filters

      include Desk::Api::Listable

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "filters"
        @return_class = Desk::Filter
      end

      def cases(id)
        Desk::Collection.new(connection.get("filters/#{id}/cases"), Desk::Case)
      end
    end
  end
end