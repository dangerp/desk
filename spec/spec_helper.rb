require File.expand_path('../../lib/desk.rb', __FILE__)

require "minitest/spec"
require 'minitest/autorun'
require 'webmock/minitest'

require_relative "../lib/desk"

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end