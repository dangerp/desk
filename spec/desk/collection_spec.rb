require_relative '../spec_helper'

describe Desk::Collection do

  subject { Desk::Collection.new(@response) }

  before { @response = {"_embedded" => {"entries" => ["foo", "bar"]}}}

  it "acts like an array" do
    assert_equal "foo", subject.first
    assert_equal "bar", subject.last
  end

end