require 'json'
require_relative '../../spec_helper'

describe Desk::Api::Articles do

  subject { Desk::Client.new(site: "yoursite", email: "user@example.com", password: "foo") }

  describe "#cases" do

    before { stub_articles_endpoint }

    it "will connect to the articles endpoint" do
      subject.articles

      assert_requested :get, @url
    end

    it "will return an array of articles" do
      result = subject.articles

      assert result.is_a? Array
      assert result.first.is_a? Desk::Article
    end
  end

  describe "#article_show" do

    before { stub_article_show_endpoint(1234) }

    it "will connect to the article show endpoint" do
      subject.article_show(1234)

      assert_requested :get, @url
    end

    it "will return a single article object" do
      result = subject.article_show(1234)

      assert result.is_a? Desk::Article
    end
  end

  def stub_articles_endpoint
    @url = "https://user@example.com:foo@yoursite.desk.com/api/v2/articles"
    stub_request(:get, @url).with(headers: { accept: 'application/json' } ).to_return(body: JSON.load(fixture("articles.json")))
  end

  def stub_article_show_endpoint(id)
    @url = "https://user@example.com:foo@yoursite.desk.com/api/v2/articles/#{id}"
    stub_request(:get, @url).with(headers: { accept: 'application/json' } ).to_return(body: JSON.load(fixture("article.json")))
  end
end