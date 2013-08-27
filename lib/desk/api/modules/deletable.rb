module Desk
  module Api
    module Deletable

      def delete(id)
        connection.delete("#{endpoint}/#{id}")
      end

    end
  end
end