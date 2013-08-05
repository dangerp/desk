require_relative '../spec_helper'

describe Desk::Collection do

  subject { Desk::Collection.new(@response, Desk::Entity) }

  before do
    @obj_1 = {foo: "bar"}
    @obj_2 = {baz: "foo"}
    @response = {"_embedded" => {"entries" => [@obj_1, @obj_2] }}
  end

  it "acts like an enumerable" do
    assert subject.respond_to? :first
    assert subject.respond_to? :last
  end

  it "coerces the objects into the provided class" do
    assert subject.last.is_a? Desk::Entity
  end

end