# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'greenin/version'

Gem::Specification.new do |spec|
  spec.name          = "greenin"
  spec.version       = Greenin::VERSION
  spec.authors       = ["Russkikh Artem"]
  spec.email         = ["russkikhartem@itbeaver.co"]
  spec.summary       = %q{Describe your grape entities in rails models}
  spec.homepage      = "http://itbeaver.co"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
