require 'json'
require_relative '../../spec_helper'

describe Desk::Api::Translations do

  before do
    @connection = Minitest::Mock.new
    @parent = Minitest::Mock.new
    @parent.expect(:endpoint, "articles/1234")
  end

  subject { Desk::Api::Translations.new(@connection, @parent) }

  describe "#all" do

    before { @connection.expect(:get, translations_fixture, ["articles/1234/translations"]) }

    it "will connect to the translations endpoint" do
      subject.all

      @connection.verify
    end

    it "will return an array of Translations" do
      result = subject.all

      assert result.is_a? Array
      assert result.first.is_a? Desk::Translation
    end
  end

  describe "#show" do

    before { @connection.expect(:get, translation_fixture, ["articles/1234/translations/es"]) }

    it "will connect to the translation show endpoint" do
      subject.show(:es)

      @connection.verify
    end

    it "will return a single translation object" do
      result = subject.show(:es)

      assert result.is_a? Desk::Translation
    end
  end

  describe "#create" do

    before do
      @data = {
                locale: "es",
                subject: "Yo quiero Desk.com API v2",
                body: "No hablo engles? Lea este."
              }

      @connection.expect(:post, translation_fixture, ["articles/1234/translations", @data])
    end

    it "will connect to the translations creation endpoint" do
      subject.create(@data)

      @connection.verify
    end
  end

  describe "#update" do
    before do
      @data = {
                subject: "Updated Spanish Translation"
              }

      @connection.expect(:patch, translation_fixture, ["articles/1234/translations/es", @data])
    end

    it "will connect to the article update endpoint" do
      subject.update(:es, @data)

      @connection.verify
    end
  end

  def translations_fixture
    JSON.load(fixture("translations.json"))
  end

  def translation_fixture
    JSON.load(fixture("translation.json"))
  end

end