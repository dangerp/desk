module Desk
  module Api
    module Listable

      def all
        Collection.new(connection.get(endpoint), return_class)
      end

      def show(id)
        raise ArgumentError "Must provide an ID" unless id
        return_class.new(connection.get("#{endpoint}/#{id}"))
      end

    end
  end
end