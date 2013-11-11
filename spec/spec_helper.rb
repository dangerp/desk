$: << File.expand_path('../lib', File.dirname(__FILE__))
require 'desk'

require "minitest/spec"
require 'minitest/autorun'
require 'minitest/reporters'
require 'webmock/minitest'

MiniTest::Reporters.use!

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end