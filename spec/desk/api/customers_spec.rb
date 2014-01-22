require 'json'
require_relative '../../spec_helper'

describe Desk::Api::Customers do

  before { @connection = Minitest::Mock.new }

  subject { Desk::Api::Customers.new(@connection) }

  describe "#all" do

    before { @connection.expect(:get, customers_fixture, ["customers"]) }

    it "will connect to the customers endpoint" do
      subject.all
    end

    it "will return an array of customers" do
      result = subject.all

      assert result.is_a? Array
      assert result.first.is_a? Desk::Customer
    end
  end

  describe "#show" do

    before { @connection.expect(:get, customer_fixture, ["customers/1234"]) }

    it "will connect to the customer show endpoint" do
      subject.show(1234)

      @connection.verify
    end

    it "will return a single customer object" do
      result = subject.show(1234)

      assert result.is_a? Desk::Customer
    end
  end

  describe "#create" do

    before do
      @data = {
          first_name: "Johnny",
          last_name: "Bravo",
          emails: [
              {
                  type: "work",
                  value: "johnny@acme.com"
              },
              {
                  type: "other",
                  value: "johnny@other.com"
              }
          ]
      }

      @connection.expect(:post, customer_fixture, ["customers", @data])
    end

    it "will connect to the customer creation endpoint" do
      subject.create(@data)

      @connection.verify
    end
  end

  describe "#update" do
    before do
      @data = {
                first_name: "Johnny",
                  emails: [
                    {
                      type: "work",
                      value: "johnny@acme.com"
                    },
                    {
                        type: "other",
                        value: "johnny@other.com"
                    }
                  ]
              }

      @connection.expect(:patch, customer_fixture, ["customers/1234", @data])
    end

    it "will connect to the customer update endpoint" do
      subject.update(1234, @data)

      @connection.verify
    end
  end

  describe "#search" do

    it "will connect to the customer search endpoint" do
      @connection.expect(:get, customers_fixture, ["customers/search", {first_name: "Johnny"}])

      subject.search(first_name: "Johnny")

      @connection.verify
    end

    it "will pass last name into the search query" do
      @connection.expect(:get, customers_fixture, ["customers/search", {first_name: "Johhny", last_name: "Bravo"}])

      subject.search(first_name: "Johhny", last_name: "Bravo")

      @connection.verify
    end

  end

  def customers_fixture
    JSON.load(fixture("customers.json"))
  end

  def customer_fixture
    JSON.load(fixture("customer.json"))
  end
end