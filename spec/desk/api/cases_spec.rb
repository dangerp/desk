require 'json'
require_relative '../../spec_helper'

class CasesSpec
  describe Desk::Api::Cases do

    before { @connection = Minitest::Mock.new }

    subject { Desk::Api::Cases.new(@connection) }

    describe "#all" do

      before { @connection.expect(:get, cases_fixture, ["cases"]) }

      it "will connect to the cases endpoint" do
        subject.all

        @connection.verify
      end

      it "will return an array of cases" do
        result = subject.all

        assert result.is_a? Array
        assert result.first.is_a? Desk::Case
      end
    end

    describe "#show" do

      before { @connection.expect(:get, case_fixture, ["cases/1234"]) }

      it "will connect to the case show endpoint" do
        subject.show(1234)

        @connection.verify
      end

      it "will return a single case object" do
        result = subject.show(1234)

        assert result.is_a? Desk::Case
      end
    end

    describe "#create" do

      before do
        @data = {
                  type: "email",
                  subject: "Creating a case via the API",
                  priority: 4,
                  status: "open",
                  labels: [
                    "Spam",
                    "Ignore"
                  ],
                  language: "fr",
                  created_at: "2012-05-01T21:38:48Z",
                  _links: {
                    customer: {
                      href: "/api/v2/customers/1",
                      class: "customer"
                    },
                    assigned_user: {
                      href: "/api/v2/users/1",
                      class: "user"
                    },
                    assigned_group: {
                      href: "/api/v2/groups/1",
                      class: "group"
                    },
                    locked_by: {
                      href: "/api/v2/users/1",
                      class: "user"
                    }
                  },
                  message: {
                    direction: "in",
                    status: "received",
                    to: "someone@desk.com",
                    from: "someone-else@desk.com",
                    cc: "alpha@desk.com",
                    bcc: "beta@desk.com",
                    subject: "Creating a case via the API",
                    body: "Please assist me with this case",
                    created_at: "2012-05-02T21:38:48Z"
                  }
                }

        @connection.expect(:post, case_fixture, ["cases", @data])
      end

      it "will connect to the case creation endpoint" do
        subject.create(@data)

        @connection.verify
      end
    end

    describe "#update" do
      before do
        @data = {
                  subject: "Updated",
                  status: "pending",
                  labels: [
                    "Spam",
                    "Test"
                  ],
                  custom_fields: {
                    level: "super"
                  },
                  _links: {
                    assigned_group: {
                      href: "/api/v2/groups/1",
                      rel: "group"
                    }
                  }
                }

        @connection.expect(:patch, case_fixture, ["cases/1234", @data])
      end

      it "will connect to the case update endpoint" do
        subject.update(1234, @data)

        @connection.verify
      end
    end

    describe "#search" do

      Desk::Api::Cases::VALID_SEARCH_PARAMS.each do |param|
        it "will pass whitelisted params into the search query" do
          @connection.expect(:get, cases_fixture, ["cases/search", {param => "foo"}])

          subject.search(param => "foo")

          @connection.verify
        end
      end

      it "will whitelist hash arguments" do
        @connection.expect(:get, cases_fixture, ["cases/search", {name: "foo"}])

        subject.search(name: "foo", bar: "baz")

        @connection.verify
      end
    end

    describe "#message" do

      before { @connection.expect(:get, message_fixture, ["cases/1234/message"]) }

      it "will connect to the case message endpoint" do
        subject.message(1234)

        @connection.verify
      end

      it "will return a single message object" do
        result = subject.message(1234)

        assert result.is_a? Desk::Message
      end
    end

    def cases_fixture
      JSON.load(fixture("cases.json"))
    end

    def case_fixture
      JSON.load(fixture("case.json"))
    end

    def message_fixture
      JSON.load(fixture("message.json"))
    end
  end
end