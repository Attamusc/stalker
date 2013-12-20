# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stalker/version'

Gem::Specification.new do |spec|
  spec.name          = 'stalker'
  spec.version       = Stalker::VERSION
  spec.authors       = ['Sean Dunn']
  spec.email         = ['sean@attamusc.com']
  spec.description   = 'TODO: Something here'
  spec.summary       = 'TODO: Something here'
  spec.homepage      = 'https://github.com/Attamusc/stalker'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'listen', '~> 2.0'
  spec.add_dependency 'thor', '~> 0.18'

  spec.add_development_dependency 'bundler', '~> 1.3.5'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
