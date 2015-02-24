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
  spec.description   = 'Describe your Grape Entities
                        in Rails Active Record models'
  spec.homepage      = 'http://itbeaver.co'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activerecord', '>= 0'
  spec.add_runtime_dependency 'railties', '>= 0'

  spec.add_development_dependency 'grape', '~> 0.11.0'
  spec.add_development_dependency 'grape-entity', '~> 0.4.4'
  spec.add_development_dependency 'rspec-rails', '~> 3.2.0'
  spec.add_development_dependency 'factory_girl_rails', '~> 4.5.0'
  spec.add_development_dependency 'database_cleaner', '~> 1.4.0'
  spec.add_development_dependency 'sqlite3', '~> 1.3.10'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
