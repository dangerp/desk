require_relative '../spec_helper'

describe Desk::Connection do

  subject { Desk::Connection.new(site: "yoursite", email: "user@example.com", password: "foo") }

  describe "#get" do
    it "will send a proper get request" do
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
      assert_equal expected, result
    end
  end

  describe "#post" do
    it "will send a proper post request" do
      data = {foo: "bar", bar: ["foo", "bar", "baz"]}
      url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases"
      stub_request(:post, url).with(data: data, headers: { accept: 'application/json' })

      subject.post("cases", data)

      assert_requested :post, url
    end
  end

  describe "#patch" do
    it "will send a proper patch request" do
      data = {foo: "bar"}
      url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases"
      stub_request(:patch, url).with(data: data, headers: { accept: 'application/json' })

      subject.patch("cases", data)

      assert_requested :patch, url
    end
  end

  describe "#delete" do
    it "will send a proper delete request" do
      url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases/1234"
      stub_request(:delete, url).with(headers: { accept: 'application/json' })

      subject.delete("cases/1234")

      assert_requested :delete, url
    end

    it "returns true if delete is successful" do
      url = "https://user@example.com:foo@yoursite.desk.com/api/v2/cases/1234"
      stub_request(:delete, url).with(headers: { accept: 'application/json' })
                                .to_return(status: 204)

      assert_equal true, subject.delete("cases/1234")
    end
  end


end