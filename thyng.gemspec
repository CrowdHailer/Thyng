# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thyng/version'

Gem::Specification.new do |spec|
  spec.name          = "thyng"
  spec.version       = Thyng::VERSION
  spec.authors       = ["Peter Saxton"]
  spec.email         = ["peterhsaxton@gmail.com"]
  spec.summary       = %q{Ruby objects with public state to encourage storage as data only collections}
  spec.description   = %q{
    Create Ruby objects with public state to encourage their storage as data only collections.
    Instead of private attributes a thyng has public aspects. Basic access to these can be declared with asect_reader, aspect_write & aspect_accessor.
    Thyng is a subclass of a plain Ruby Hash allowing merging, filtering etc of the objects aspects.
    With all state external a thyng can be reconstructed completly from its data. This allows it to be passed as JSON or easily stored in a database.
  }
  spec.homepage      = "https://github.com/CrowdHailer/Thyng"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.4.3"
  spec.add_development_dependency "minitest-reporters", "~> 1.0.6"

  spec.add_dependency "bcrypt", "~> 3.1.7"
end
