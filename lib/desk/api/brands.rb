require 'desk/api/modules/listable'
require 'desk/brand'

module Desk
  module Api
    class Brands

      include Desk::Api::Listable

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "brands"
        @return_class = Desk::Brand
      end
    end
  end
end