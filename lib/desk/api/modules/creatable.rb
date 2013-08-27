module Desk
  module Api
    module Creatable

      def create(data)
        return_class.new(connection.post(endpoint, data))
      end

      def update(id, data)
        return_class.new(connection.patch("#{endpoint}/#{id}", data))
      end

    end
  end
end