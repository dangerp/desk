require 'json'
require_relative '../../spec_helper'

describe Desk::Api::Cases do

  subject { Desk::Client.new(site: "yoursite", email: "user@example.com", password: "foo") }

  describe "#cases" do

    before { stub_cases_endpoint }

    it "will connect to the cases endpoint" do
      subject.cases

      assert_requested :get, @url
    end

    it "will return an array of cases" do
      result = subject.cases

      assert result.is_a? Array
      assert result.first.is_a? Desk::Case
    end

  end

  describe "#cases_search" do

    before do
      @query = {name: "John"}
      stub_cases_search_endpoint(@query)
    end

    it "will connect to the cases search endpoint" do
      subject.cases_search(@query)

      assert_requested :get, @url, query: @query
    end

    it "will return an array of cases" do
      result = subject.cases_search(@query)

      assert result.is_a? Array
      assert result.first.is_a? Desk::Case
    end

  end



  def stub_cases_endpoint
    @url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases"
    stub_request(:get, @url).with(headers: { accept: 'application/json' } ).to_return(body: JSON.load(fixture("cases.json")))
  end

  def stub_cases_search_endpoint(query)
    @url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases/search"
    stub_request(:get, @url).with(headers: { accept: 'application/json' }, query: query ).to_return(body: JSON.load(fixture("cases.json")))
  end
end