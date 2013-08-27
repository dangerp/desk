module Desk
  module Api
    module Searchable

      def search(opts={})
        params = opts.slice(*valid_search_params)

        connection.get("#{endpoint}/search", params)
      end

    end
  end
end