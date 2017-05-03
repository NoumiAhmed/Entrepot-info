# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','GP','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'GP'
  s.version = GP::VERSION
  s.author = 'Omer Tombul, Ahmed Noumi'
  s.email = 'tombul.omer@courrier.uqam.ca'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Un gestionnaire pour un entrepot de pieces informatique '
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','GP.rdoc']
  s.rdoc_options << '--title' << 'GP' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'GP'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_runtime_dependency('gli','2.14.0')
  s.add_development_dependency('minitest')
end
