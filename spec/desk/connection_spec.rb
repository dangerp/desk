require_relative '../spec_helper'

describe Desk::Connection do

  subject { Desk::Connection.new(site: "yoursite", email: "user@example.com", password: "foo") }

  describe "#get" do
    it "will send a proper get response" do
      url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases"
      stub_request(:get, url).with(headers: { accept: 'application/json' } )

      subject.get("cases")

      assert_requested :get, url
    end

    it "will convert the response to a hash" do
      url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases"
      stub_request(:get, url).to_return(body: '{"foo":"bar"}', status: 200)

      result = subject.get("cases")
      expected = { "foo" => "bar" }
      assert_equal expected, result.body
    end
  end


end