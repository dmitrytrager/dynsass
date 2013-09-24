# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynsass/version'

Gem::Specification.new do |spec|
  spec.name          = "dynsass"
  spec.version       = Dynsass::VERSION
  spec.authors       = ["Dmitry Trager"]
  spec.email         = ["dmitry.trager@flatstack.com"]
  spec.description   = %q{Generates custom Sass stylesheet that will be compiled dynamically during runtime}
  spec.summary       = %q{Custom Sass stylesheets generator}
  spec.homepage      = "https://github.com/dmitrytrager/dynsass"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
