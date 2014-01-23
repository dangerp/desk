require 'desk/api/modules/listable'
require 'desk/inbound_mailbox'

module Desk
  module Api
    class InboundMailboxes

      include Desk::Api::Listable

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "inbound_mailbox"
        @return_class = Desk::InboundMailbox
      end
    end
  end
end