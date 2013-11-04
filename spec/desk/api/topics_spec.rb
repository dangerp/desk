require 'json'
require_relative '../../spec_helper'

describe Desk::Api::Topics do

  before { @connection = Minitest::Mock.new }

  subject { Desk::Api::Topics.new(@connection) }

  describe "#all" do

    before { @connection.expect(:get, topics_fixture, ["topics"]) }

    it "will connect to the topics endpoint" do
      subject.all
    end

    it "will return an array of topics" do
      result = subject.all

      assert result.is_a? Array
      assert result.first.is_a? Desk::Topic
    end
  end

  describe "#show" do

    before { @connection.expect(:get, topic_fixture, ["topics/1234"]) }

    it "will connect to the topic show endpoint" do
      subject.show(1234)

      @connection.verify
    end

    it "will return a single topic object" do
      result = subject.show(1234)

      assert result.is_a? Desk::Topic
    end
  end

  describe "#create" do

    before do
      @data = {
          name: "Social Media",
          allow_questions: true,
          in_support_center: true
      }

      @connection.expect(:post, topic_fixture, ["topics", @data])
    end

    it "will connect to the topic creation endpoint" do
      subject.create(@data)

      @connection.verify
    end
  end

  describe "#update" do
    before do
      @data = {
          name: "New Name",
          allow_questions: false,
          in_support_center: true
      }

      @connection.expect(:patch, topic_fixture, ["topics/1234", @data])
    end

    it "will connect to the topic update endpoint" do
      subject.update(1234, @data)

      @connection.verify
    end
  end

  describe "#delete" do

    before { @connection.expect(:delete, true, ["topics/1234"]) }

    it "will connect to the topic delete endpoint" do
      subject.delete(1234)

      @connection.verify
    end
  end

  def topics_fixture
    JSON.load(fixture("topics.json"))
  end

  def topic_fixture
    JSON.load(fixture("topic.json"))
  end
end