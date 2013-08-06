module Desk
  module Api
    module Articles

      def articles
        Collection.new(connection.get("articles"), Desk::Article)
      end

      def article_show(id)
        raise ArgumentError "Must provide a case ID" unless id
        Article.new(connection.get("articles/#{id}"))
      end

    end
  end
end