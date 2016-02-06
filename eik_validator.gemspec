# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eik_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "eik_validator"
  spec.version       = EikValidator::VERSION
  spec.authors       = ["V. Stoyanov"]
  spec.email         = ["stoyanov.veseline@gmail.com"]

  spec.summary       = %q{This gem helps you to check whether a Bulgarian EIK number is valid or not.}
  spec.homepage      = "https://github.com/veskoy/eik_validator"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
