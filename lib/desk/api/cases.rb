require 'active_support/core_ext/hash'
require 'desk/api/modules/listable'
require 'desk/api/modules/creatable'
require 'desk/api/modules/searchable'
require 'desk/case'
require 'desk/message'

module Desk
  module Api
    class Cases

      include Desk::Api::Listable
      include Desk::Api::Creatable
      include Desk::Api::Searchable

      VALID_SEARCH_PARAMS= [:name, :first_name, :last_name, :email, :phone,
                            :company, :twitter, :labels, :case_id, :subject,
                            :description, :status, :priority, :assigned_group,
                            :assigned_user, :channels, :notes, :attachments,
                            :case_custom_key, :created, :updated, :since_created_at,
                            :max_created_at, :since_updated_at, :max_updated_at,
                            :since_id, :max_id]

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "cases"
        @return_class = Desk::Case
      end

      def message(id)
        Desk::Message.new(connection.get("cases/#{id}/message"))
      end

      private

      def valid_search_params
        VALID_SEARCH_PARAMS
      end
    end
  end
end