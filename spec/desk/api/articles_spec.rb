require 'json'
require_relative '../../spec_helper'

describe Desk::Api::Articles do

  before { @connection = Minitest::Mock.new }

  subject { Desk::Api::Articles.new(@connection) }

  describe "#all" do

    before { @connection.expect(:get, articles_fixture, ["articles"]) }

    it "will connect to the articles endpoint" do
      subject.all
    end

    it "will return an array of articles" do
      result = subject.all

      assert result.is_a? Array
      assert result.first.is_a? Desk::Article
    end
  end

  describe "#show" do

    before { @connection.expect(:get, article_fixture, ["articles/1234"]) }

    it "will connect to the article show endpoint" do
      subject.show(1234)

      @connection.verify
    end

    it "will return a single article object" do
      result = subject.show(1234)

      assert result.is_a? Desk::Article
    end
  end

  describe "#create" do

    before do
      @data = {
                subject: "How to make your customers happy",
                body: "<strong>Use Desk.com</strong>",
                body_email: "Custom email body for article",
                body_email_auto: false,
                _links: { topic: { href: "/api/v2/topics/1", class: "topic" } }
             }

      @connection.expect(:post, article_fixture, ["articles", @data])
    end

    it "will connect to the article creation endpoint" do
      subject.create(@data)

      @connection.verify
    end
  end

  describe "#update" do
    before do
      @data = {
                subject: "How to make your customers happy",
                body: "<strong>Use Desk.com</strong>",
                body_email: "Email just doesn't cut it",
                body_email_auto: false,
                body_twitter: "Use Desk.com in 140 chars or less",
                body_twitter_auto: false,
                _links: {
                  topic: {
                    href: "/api/v2/topics/2"
                  }
                }
              }

      @connection.expect(:patch, article_fixture, ["articles/1234", @data])
    end

    it "will connect to the article update endpoint" do
      subject.update(1234, @data)

      @connection.verify
    end
  end

  describe "#delete" do

    before { @connection.expect(:delete, true, ["articles/1234"]) }

    it "will connect to the article delete endpoint" do
      subject.delete(1234)

      @connection.verify
    end
  end

  describe "#search" do

    it "will connect to the article search endpoint" do
      @connection.expect(:get, articles_fixture, ["articles/search", {text: "foo"}])

      subject.search(text: "foo")

      @connection.verify
    end

    it "will pass topic IDs into the search query" do
      @connection.expect(:get, articles_fixture, ["articles/search", {text: "foo", topic_ids: [1,2,3]}])

      subject.search(text: "foo", topic_ids: [1,2,3])

      @connection.verify
    end

    it "will whitelist hash arguments" do
      @connection.expect(:get, articles_fixture, ["articles/search", {text: "foo", topic_ids: [1,2,3]}])

      subject.search(text: "foo", topic_ids: [1,2,3], bar: "baz")

      @connection.verify
    end
  end

  def articles_fixture
    JSON.load(fixture("articles.json"))
  end

  def article_fixture
    JSON.load(fixture("article.json"))
  end
end