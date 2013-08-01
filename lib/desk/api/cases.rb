module Desk
  module Api
    module Cases

      def cases
        Collection.new(connection.get("cases"))
      end

    end
  end
end