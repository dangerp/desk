require 'desk/api/modules/listable'
require 'desk/api/modules/creatable'
require 'desk/translation'

module Desk
  module Api
    class Translations

      include Desk::Api::Listable
      include Desk::Api::Creatable

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection, parent)
        @connection = connection
        raise ArgumentError unless parent
        @parent = parent
        @endpoint = "#{parent.endpoint}/translations"
        @return_class = Desk::Translation
      end

    end
  end
end