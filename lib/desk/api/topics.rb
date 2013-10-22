require 'active_support/core_ext/hash'
require 'desk/api/modules/listable'
require 'desk/api/modules/creatable'
require 'desk/api/modules/deletable'
require 'desk/topic'

module Desk
  module Api
    class Topics

      include Desk::Api::Listable
      include Desk::Api::Creatable
      include Desk::Api::Deletable

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "topics"
        @return_class = Desk::Topic
      end

    end
  end
end