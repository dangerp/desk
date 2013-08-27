require 'active_support/core_ext/hash'

module Desk
  module Api
    class Cases

      VALID_SEARCH_PARAMS= [:name, :first_name, :last_name, :email, :phone,
                            :company, :twitter, :labels, :case_id, :subject,
                            :description, :status, :priority, :assigned_group,
                            :assigned_user, :channels, :notes, :attachments,
                            :case_custom_key, :created, :updated, :since_created_at,
                            :max_created_at, :since_updated_at, :max_updated_at,
                            :since_id, :max_id]

      def initialize(connection)
        @connection = connection
      end

      def all
        Collection.new(@connection.get("cases"), Desk::Case)
      end

      def show(id)
        raise ArgumentError "Must provide a case ID" unless id
        Desk::Case.new(@connection.get("cases/#{id}"))
      end

      def create(case_data)
        Desk::Case.new(@connection.post("cases", case_data))
      end

      def update(id, case_data)
        Desk::Case.new(@connection.patch("cases/#{id}", case_data))
      end

      def search(opts={})
        params = opts.slice(*VALID_SEARCH_PARAMS)

        @connection.get("cases/search", params)
      end
    end
  end
end