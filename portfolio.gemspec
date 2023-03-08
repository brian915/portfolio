# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "portfolio"
  spec.version       = "0.1"
  spec.authors       = ["Brian Runk"]
  spec.email         = ["brian@brianrunk.net"]

  spec.summary       = "A port of the Ghost theme, from a Ghost Gatsby project, to Jekyll, heavily customized, with bits of moonwalk"
  spec.homepage      = "https://github.com/brian915/portfolio"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3.2"
  spec.add_runtime_dependency "jekyll-feed"
  spec.add_runtime_dependency "jekyll-seo-tag"
  spec.add_runtime_dependency "rouge", "~> 3.23.0"
  spec.add_runtime_dependency "webrick", "~> 1.7"
end
