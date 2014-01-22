Gem::Specification.new do |s|
  s.name                     = "desk_api_v2"
  s.version                  = "0.0.2"
  s.platform                 = Gem::Platform::RUBY
  s.authors                  = ["Justin Powers"]
  s.email                    = ["justinspowers@gmail.com"]
  s.homepage                 = "http://github.com/dangerp/desk"
  s.summary                  = "A ruby interface to the Desk.com API V2"
  s.description              = s.summary
  s.licenses              = ['MIT']
  s.required_ruby_version = '>= 1.9.2'

  s.required_rubygems_version = ">= 1.3.6"

  s.files         = `git ls-files`.split("\n")

  s.require_path = 'lib'

  s.add_dependency "faraday_middleware", "~> 0.9.0"
  s.add_dependency "activesupport", "~> 3.2.13"

  s.add_development_dependency "pry", "~> 0.9.12"
  s.add_development_dependency "rake", "~> 10.0.4"
  s.add_development_dependency "webmock", "~> 1.11.0"
  s.add_development_dependency "minitest", "~> 3.5.0"
  s.add_development_dependency "minitest-reporters", "~> 0.14.20"
  s.add_development_dependency "bump"
end