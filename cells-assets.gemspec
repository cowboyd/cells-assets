# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cell/assets/version"

Gem::Specification.new do |s|
  s.name        = "cells-assets"
  s.version     = Cell::Assets::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Charles Lowell"]
  s.email       = ["cowboyd@thefrontside.net"]
  s.homepage    = "http://github.com/cowboyd/cells-assets"
  s.summary     = "Query your cells for things that are theirs and theirs alone"
  s.description = "CSS, Javascript, images. These are your cell's business and nobody else's. Keep your cell's private data where it belongs"

  s.rubyforge_project = "cells-assets"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "cells", ">= 3.5.0"
  s.add_development_dependency "rspec", ">= 2.0.0"
end
