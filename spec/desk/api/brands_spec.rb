require 'json'
require_relative '../../spec_helper'

class BrandsSpec
  describe Desk::Api::Brands do

    before { @connection = Minitest::Mock.new }

    subject { Desk::Api::Brands.new(@connection) }

    describe "#all" do

      it "will return an array of brands" do
        assert_returns_array_of(Desk::Brand, endpoint: "brands", fixture: brands_fixture) { subject.all }
      end
    end

    describe "#show" do
      it "will return a single brand object" do
        assert_returns_one_of(Desk::Brand, endpoint: "brands/1234", fixture: brand_fixture) { subject.show(1234) }
      end
    end

    def brands_fixture
      JSON.load(fixture("brands.json"))
    end

    def brand_fixture
      JSON.load(fixture("brand.json"))
    end
  end
end