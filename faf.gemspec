$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'faf/version'

Gem::Specification.new do |s|
  s.name = 'faf'
  s.bindir = 'bin'
  s.executables << 'faf'
  s.version = Faf::VERSION
  s.authors = ['Daniel Doubrovkine']
  s.email = 'dblock@dblock.org'
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files = Dir['{bin,lib}/**/*'] + Dir['*.md']
  s.require_paths = ['lib']
  s.homepage = 'http://github.com/dblock/faf'
  s.licenses = ['MIT']
  s.summary = 'Find active GitHub forks.'
  s.add_dependency 'github_api', '~> 0.18.2'
  s.add_dependency 'gli', '~> 2.17'
  s.add_dependency 'graphlient', '~> 0.3.2'
  s.add_dependency 'time_ago_in_words'
end
