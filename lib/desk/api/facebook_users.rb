require 'desk/api/modules/listable'
require 'desk/facebook_user'

module Desk
  module Api
    class FacebookUsers

      include Desk::Api::Listable

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "facebook_users"
        @return_class = Desk::FacebookUser
      end
    end
  end
end