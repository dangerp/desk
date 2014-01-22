require 'json'
require_relative '../../spec_helper'

class FacebookUsersSpec
  describe Desk::Api::FacebookUsers do

    before { @connection = Minitest::Mock.new }

    subject { Desk::Api::FacebookUsers.new(@connection) }

    describe "#all" do

      it "will return an array of facebook users" do
        assert_returns_array_of(Desk::FacebookUser, endpoint: "facebook_users", fixture: facebook_users_fixture) { subject.all }
      end
    end

    describe "#show" do
      it "will return a single facebook user object" do
        assert_returns_one_of(Desk::FacebookUser, endpoint: "facebook_users/1234", fixture: facebook_user_fixture) { subject.show(1234) }
      end
    end

    def facebook_users_fixture
      JSON.load(fixture("facebook_users.json"))
    end

    def facebook_user_fixture
      JSON.load(fixture("facebook_user.json"))
    end
  end
end