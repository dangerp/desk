module Desk
  module Api
    module Cases

      def cases
        Collection.new(connection.get("cases"), Desk::Case)
      end

      def cases_search(query={})
        Collection.new(connection.get("cases/search", query), Desk::Case)
      end

      def case_show(id)
        raise ArgumentError "Must provide a case ID" unless id
        Desk::Case.new(connection.get("cases/#{id}"))
      end

    end
  end
end