require 'json'
require_relative '../../spec_helper'

describe Desk::Api::Cases do

  subject { Desk::Client.new(site: "yoursite", email: "user@example.com", password: "foo") }

  describe "#cases" do

    before do
      stub_cases_endpoint
    end

    it "will connect to the cases endpoint" do
      subject.cases

      assert_requested :get, @url
    end

    it "will return an array of cases" do
      result = subject.cases

      assert subject.cases.is_a? Array
      assert subject.cases.first.is_a? Case
    end

    def stub_cases_endpoint
      @url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases"
      stub_request(:get, @url).with(headers: { accept: 'application/json' } ).to_return(body: JSON.load(fixture("cases.json")))
    end

  end
end