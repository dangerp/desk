require 'desk/api/modules/listable'
require 'desk/customer'
require 'desk/filter'
require 'desk/user'

module Desk
  module Api
    class Groups

      include Desk::Api::Listable

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "groups"
        @return_class = Desk::Group
      end

      def filters(id)
        Desk::Collection.new(connection.get("groups/#{id}/filters"), Desk::Filter)
      end

      def users(id)
        Desk::Collection.new(connection.get("groups/#{id}/users"), Desk::User)
      end

    end
  end
end