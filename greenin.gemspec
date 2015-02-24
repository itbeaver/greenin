# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'greenin/version'

Gem::Specification.new do |spec|
  spec.name          = 'greenin'
  spec.version       = Greenin::VERSION
  spec.authors       = ['Russkikh Artem']
  spec.email         = ['russkikhartem@itbeaver.co']
  spec.summary       = 'Grape Entities in Rails models'
  spec.description   = 'Describe your Grape Entities in Rails Active Record models'
  spec.homepage      = 'http://itbeaver.co'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'factory_girl'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
