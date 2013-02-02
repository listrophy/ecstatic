# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ecstatic/version'

Gem::Specification.new do |gem|
  gem.name          = "ecstatic"
  gem.version       = Ecstatic::VERSION
  gem.authors       = ["Bradley Grzesiak"]
  gem.email         = ["brad@bendyworks.com"]
  gem.description   = %q{A static site generator focused on simplicity}
  gem.summary       = %q{Ecstatic is a static site generator focused on simplicity. It uses just enough of the right tools, leaving as much power in your hands while still providing plenty of value. Ecstatic is opinionated in favor of HAML, SASS, and CoffeeScript.}
  gem.homepage      = "http://github.com/listrophy/ecstatic"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'coffee-script'
  gem.add_dependency 'haml'
  gem.add_dependency 'rake'
  gem.add_dependency 'rdiscount'
  gem.add_dependency 'sass'
  gem.add_dependency 'sinatra'
  gem.add_dependency 'thor'
  gem.add_dependency 'watchr'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'
end
