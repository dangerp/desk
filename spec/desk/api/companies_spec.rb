require 'json'
require_relative '../../spec_helper'

class CompaniesSpec
  describe Desk::Api::Companies do

    before { @connection = Minitest::Mock.new }

    subject { Desk::Api::Companies.new(@connection) }

    describe "#all" do

      it "will return an array of brands" do
        assert_returns_array_of(Desk::Company, endpoint: "companies", fixture: companies_fixture) { subject.all }
      end
    end

    describe "#show" do
      it "will return a single company object" do
        assert_returns_one_of(Desk::Company, endpoint: "companies/1234", fixture: company_fixture) { subject.show(1234) }
      end
    end

    describe "#create" do

      before do
        @connection.expect(:post, company_fixture, ["companies", company_create_fixture])
      end

      it "will connect to the case creation endpoint" do
        subject.create(company_create_fixture)

        @connection.verify
      end
    end

    describe "#update" do
      before do
        @connection.expect(:patch, company_fixture, ["companies/1234", company_update_fixture])
      end

      it "will connect to the case update endpoint" do
        subject.update(1234, company_update_fixture)

        @connection.verify
      end
    end

    describe "#search" do

      it "will pass whitelisted params into the search query" do
        @connection.expect(:get, companies_fixture, ["companies/search", {q: "foo"}])

        subject.search(q: "foo")

        @connection.verify
      end

      it "will whitelist hash arguments" do
        @connection.expect(:get, companies_fixture, ["companies/search", {q: "foo"}])

        subject.search(q: "foo", bar: "baz")

        @connection.verify
      end
    end

    describe "#cases" do

      before { @connection.expect(:get, cases_fixture, ["companies/1234/cases"]) }

      it "will return an array of cases" do
        assert_returns_array_of(Desk::Case, endpoint: "companies/1234/cases", fixture: cases_fixture) { subject.cases(1234) }
      end
    end

    def companies_fixture
      JSON.load(fixture("companies.json"))
    end

    def company_fixture
      JSON.load(fixture("company.json"))
    end

    def company_create_fixture
      JSON.load(fixture("company_create.json"))
    end

    def company_update_fixture
      JSON.load(fixture("company_update.json"))
    end

    def cases_fixture
      JSON.load(fixture("cases.json"))
    end
  end
end