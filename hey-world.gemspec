# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "hey-world"
  spec.version       = "0.1.5"
  spec.authors       = ["Ben Wilson"]
  spec.email         = ["ben@merovex.com"]

  spec.summary       = "A clean, minimal Jekyll theme for authors and bloggers"
  spec.description   = "Hey World is a Jekyll theme designed for authors and bloggers who want a clean, accessible design with dark/light mode support, newsletter integration, and a focus on content."
  spec.homepage      = "https://github.com/merovex/hey-world"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["plugin_type"] = "theme"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(assets|_layouts|_includes|_sass|lib|LICENSE|README|_config\.yml|\.gitignore)!i)
  end

  spec.add_runtime_dependency "jekyll", ">= 3.9", "< 5.0"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.15"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 13.0"
end