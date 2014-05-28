# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kuromoji/version'

Gem::Specification.new do |spec|
  spec.name          = "kuromoji-ruby"
  spec.version       = Kuromoji::VERSION
  spec.authors       = ["toyama0919"]
  spec.email         = ["toyama0919@gmail.com"]
  spec.summary       = "A ruby wrapper for the Kuromoji Japanese morphological analyzer."
  spec.description   = "kuromoji provides ruby API for Kuromoji(http://www.atilika.org/) Japanese morphological analyzer using rjb."
  spec.homepage      = "https://github.com/toyama0919/kuromoji-ruby"
  spec.license       = "Apache License, Version 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency "rjb"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "yajl-ruby"
end
