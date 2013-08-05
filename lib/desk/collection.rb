module Desk
  class Collection < Array

    def initialize(response, klass)
      @response = response
      super response["_embedded"]["entries"]
      coerce_into klass
    end

    private

    def coerce_into(klass)
      self.map! { |obj| klass.new(obj) }
    end

  end
end