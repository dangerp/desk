require 'json'
require_relative '../../spec_helper'

class CustomFieldsSpec
  describe Desk::Api::CustomFields do

    before { @connection = Minitest::Mock.new }

    subject { Desk::Api::CustomFields.new(@connection) }

    describe "#all" do

      it "will return an array of custom fields" do
        assert_returns_array_of(Desk::CustomField, endpoint: "custom_fields", fixture: custom_fields_fixture) { subject.all }
      end
    end

    describe "#show" do
      it "will return a single custom field object" do
        assert_returns_one_of(Desk::CustomField, endpoint: "custom_fields/1234", fixture: custom_field_fixture) { subject.show(1234) }
      end
    end

    def custom_fields_fixture
      JSON.load(fixture("custom_fields.json"))
    end

    def custom_field_fixture
      JSON.load(fixture("custom_field.json"))
    end
  end
end