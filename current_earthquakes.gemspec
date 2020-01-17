lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "current_earthquakes/version"

Gem::Specification.new do |spec|
  spec.name          = "current_earthquakes"
  spec.version       = CurrentEarthquakes::VERSION
  spec.authors       = ["enigmalb"]
  spec.email         = ["enigmalb@outlook.com"]

  spec.summary       = %q{short summary of my gem.}
  spec.description   = %q{longer summary of my gem.}
  spec.homepage      = "http://github.com"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://github.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com"
  spec.metadata["changelog_uri"] = "http://github.com"


  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"

  spec.add_development_dependency "rake", "~> 10.0"
end
