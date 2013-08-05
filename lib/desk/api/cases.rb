module Desk
  module Api
    module Cases

      def cases
        Collection.new(connection.get("cases"), Desk::Case)
      end

      def cases_search(query={})
        Collection.new(connection.get("cases/search", query), Desk::Case)
      end

    end
  end
end