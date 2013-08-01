module Desk
  class Collection < Array

    def initialize(response)
      @response = response
      super response["_embedded"]["entries"]
    end

  end
end