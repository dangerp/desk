module Desk
  module Api
    module Cases

      def cases
        connection.get("cases")
      end

    end
  end
end