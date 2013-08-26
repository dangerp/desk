require 'ostruct'

module Desk
  class Article < Entity

    def translations
      @translations ||= Desk::Api::Translations.new
    end

  end
end
