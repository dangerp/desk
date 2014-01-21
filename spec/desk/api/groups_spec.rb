require 'json'
require_relative '../../spec_helper'

class GroupsSpec
  describe Desk::Api::Groups do

    before { @connection = Minitest::Mock.new }

    subject { Desk::Api::Groups.new(@connection) }

    describe "#all" do

      before { @connection.expect(:get, groups_fixture, ["groups"]) }

      it "will connect to the groups endpoint" do
        subject.all

        @connection.verify
      end

      it "will return an array of groups" do
        result = subject.all

        assert result.is_a? Array
        assert result.first.is_a? Desk::Group
      end
    end

    describe "#show" do

      before { @connection.expect(:get, group_fixture, ["groups/1234"]) }

      it "will connect to the group show endpoint" do
        subject.show(1234)

        @connection.verify
      end

      it "will return a single group object" do
        result = subject.show(1234)

        assert result.is_a? Desk::Group
      end
    end

    describe "#filters" do

      before { @connection.expect(:get, filters_fixture, ["groups/1234/filters"]) }

      it "will connect to the case filters endpoint" do
        subject.filters(1234)

        @connection.verify
      end

      it "will return an array of filters object" do
        result = subject.filters(1234)

        assert result.is_a? Array
        assert result.first.is_a? Desk::Filter
      end
    end

    describe "#users" do

      before { @connection.expect(:get, users_fixture, ["groups/1234/users"]) }

      it "will connect to the case users endpoint" do
        subject.users(1234)

        @connection.verify
      end

      it "will return an array of users object" do
        result = subject.users(1234)

        assert result.is_a? Array
        assert result.first.is_a? Desk::User
      end
    end

    def groups_fixture
      JSON.load(fixture("groups.json"))
    end

    def group_fixture
      JSON.load(fixture("group.json"))
    end

    def filters_fixture
      JSON.load(fixture("group_filters.json"))
    end

    def users_fixture
      JSON.load(fixture("group_users.json"))
    end
  end
end