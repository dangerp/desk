require 'json'
require_relative '../../spec_helper'

class InboundMailboxesSpec
  describe Desk::Api::InboundMailboxes do

    before { @connection = Minitest::Mock.new }

    subject { Desk::Api::InboundMailboxes.new(@connection) }

    describe "#all" do
      it "will return an array of inbound mailboxes" do
        assert_returns_array_of(Desk::InboundMailbox, endpoint: "inbound_mailbox", fixture: inbound_mailboxes_fixture) { subject.all }
      end
    end

    describe "#show" do
      it "will return a single inbound mailbox object" do
        assert_returns_one_of(Desk::InboundMailbox, endpoint: "inbound_mailbox/1234", fixture: inbound_mailbox_fixture) { subject.show(1234) }
      end
    end

    def inbound_mailboxes_fixture
      JSON.load(fixture("inbound_mailboxes.json"))
    end

    def inbound_mailbox_fixture
      JSON.load(fixture("inbound_mailbox.json"))
    end
  end
end