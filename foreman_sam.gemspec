$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'foreman_sam/version'

Gem::Specification.new do |s|
  s.name        = 'foreman_sam'
  s.version     = ForemanSAM::VERSION
  s.authors     = ['Red Hat']
  s.email       = ['foreman-dev@googlegroups.com']
  s.homepage    = 'http://katello.org'
  s.summary     = 'Katello SAM UI'
  s.description = 'Katello SAM UI'

  s.files = Dir['{app,config,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'katello'

  s.add_development_dependency 'rubocop-checkstyle_formatter'
end
