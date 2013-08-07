module Desk
  module Api
    class Articles

      def initialize(connection)
        @connection = connection
      end

      def all
        Collection.new(@connection.get("articles"), Desk::Article)
      end

      def show(id)
        raise ArgumentError "Must provide a case ID" unless id
        Article.new(@connection.get("articles/#{id}"))
      end

      def create(article)
        Article.new(@connection.post("articles", article))
      end

      def update(id, article)
        Article.new(@connection.patch("articles/#{id}", article))
      end

      def delete(id)
        @connection.delete("articles/#{id}")
      end
    end
  end
end