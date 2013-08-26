require_relative '../spec_helper'

describe Desk::Article do

  subject { Desk::Article.new }

  describe "#translations" do

    it "returns the translations API object" do
      skip "Translations not yet implemented"
      assert subject.translations.is_a? Desk::Api::Translations
    end

  end

end