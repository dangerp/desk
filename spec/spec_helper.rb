require File.expand_path('../../lib/desk.rb', __FILE__)

require "minitest/spec"
require 'minitest/autorun'
require 'minitest/reporters'
require 'webmock/minitest'

require_relative "../lib/desk"

MiniTest::Reporters.use! [MiniTest::Reporters::SpecReporter.new]

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end