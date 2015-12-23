# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "venice/version"

Gem::Specification.new do |spec|
  spec.name          = "venice-chr"
  spec.version       = Venice::VERSION
  spec.authors       = ["Alexander Kravets"]
  spec.email         = ["alex@slatestudio.com"]
  spec.summary       = %q{Blog boilerplate for Character based website}
  spec.homepage      = "http://github.com/alexkravets/venice"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executable    = "venice"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "thor"
end
