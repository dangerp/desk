require 'active_support/core_ext/hash'
require 'desk/api/modules/listable'
require 'desk/api/modules/creatable'
require 'desk/api/modules/searchable'
require 'desk/api/modules/deletable'
require 'desk/article'

module Desk
  module Api
    class Articles

      include Desk::Api::Listable
      include Desk::Api::Creatable
      include Desk::Api::Searchable
      include Desk::Api::Deletable

      VALID_SEARCH_PARAMS = [:text, :topic_ids]

      attr_reader :connection, :endpoint, :return_class

      def initialize(connection)
        @connection = connection
        @endpoint = "articles"
        @return_class = Desk::Article
      end

      private

      def valid_search_params
        VALID_SEARCH_PARAMS
      end
    end
  end
end