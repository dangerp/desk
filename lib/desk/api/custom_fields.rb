require 'desk/api/modules/listable'
require 'desk/custom_field'

module Desk
  module Api
    class CustomFields

      include Desk::Api::Listable

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "custom_fields"
        @return_class = Desk::CustomField
      end
    end
  end
end