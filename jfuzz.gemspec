# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jfuzz/version"

Gem::Specification.new do |spec|
  spec.name          = "jfuzz"
  spec.version       = Jfuzz::VERSION
  spec.authors       = ["George Allen"]
  spec.email         = ["george.allen93@outlook.com"]

  spec.summary       = "Fuzz test your JSON schemas"
  spec.description   = "Generate random data based on your JSON schemas"
  spec.homepage      = "https://github.com/georgea93/jfuzz"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 5.2"
  spec.add_dependency "json_schema", "~> 0.17"
  spec.add_dependency "regexp-examples", "~> 1.4"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "pry", "~> 0.9.10"
  spec.add_development_dependency "pry-nav", "~> 0.2.4"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.57.0"
  spec.add_development_dependency "rubocop-rspec", "~> 1.25"
end
