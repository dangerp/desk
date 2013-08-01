Gem::Specification.new do |s|
  s.name                     = "desk"
  s.version                  = "0.0.1"
  s.platform                 = Gem::Platform::RUBY
  s.authors                  = ["Justin Powers"]
  s.email                    = ["justinspowers@gmail.com"]
  s.homepage                 = "http://github.com/dangerp/desk"
  s.summary                  = "A ruby interface to the Desk.com API"
  s.description              = s.summary
  s.licenses              = ['MIT']
  s.required_ruby_version = '>= 1.9.2'

  s.required_rubygems_version = ">= 1.3.6"

  # If you have runtime dependencies, add them here
  # s.add_runtime_dependency "other", "~> 1.2"

  # If you have development dependencies, add them here
  # s.add_development_dependency "another", "= 0.9"

  # The list of files to be contained in the gem
  s.files         = `git ls-files`.split("\n")

  s.require_path = 'lib'
end