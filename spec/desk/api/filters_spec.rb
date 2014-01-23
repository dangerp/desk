require 'json'
require_relative '../../spec_helper'

class FiltersSpec
  describe Desk::Api::Filters do

    before { @connection = Minitest::Mock.new }

    subject { Desk::Api::Filters.new(@connection) }

    describe "#all" do

      it "will return an array of filters" do
        assert_returns_array_of(Desk::Filter, endpoint: "filters", fixture: filters_fixture) { subject.all }
      end
    end

    describe "#show" do
      it "will return a single filter object" do
        assert_returns_one_of(Desk::Filter, endpoint: "filters/1234", fixture: filter_fixture) { subject.show(1234) }
      end
    end

    describe "#cases" do
      before { @connection.expect(:get, cases_fixture, ["filters/1234/cases"]) }

      it "will return an array of cases" do
        assert_returns_array_of(Desk::Case, endpoint: "filters/1234/cases", fixture: cases_fixture) { subject.cases(1234) }
      end
    end

    def filters_fixture
      JSON.load(fixture("filters.json"))
    end

    def filter_fixture
      JSON.load(fixture("filter.json"))
    end

    def cases_fixture
      JSON.load(fixture("cases.json"))
    end
  end
end