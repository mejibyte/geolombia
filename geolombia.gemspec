# -*- encoding: utf-8 -*-
require File.expand_path('../lib/geolombia/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrés Mejía"]
  gem.email         = ["andmej@gmail.com"]
  gem.description   = %q{This gem gives you a list of all cities and states in Colombia and a few methods to work with them.}
  gem.summary       = %q{This gem gives you a list of all cities and states in Colombia and a few methods to work with them.}
  gem.homepage      = ""

  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "geolombia"
  gem.require_paths = ["lib"]
  gem.version       = Geolombia::VERSION
end
