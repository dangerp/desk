require_relative '../../spec_helper'

describe Desk::Api::Cases do

  subject { Desk::Client.new(site: "yoursite", email: "user@example.com", password: "foo") }

  describe "#cases" do

    it "will connect to the cases endpoint" do
      url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases"
      stub_request(:get, url).with(headers: { accept: 'application/json' } )

      subject.cases

      assert_requested :get, url
    end

    it "will return an array of cases"

  end

end