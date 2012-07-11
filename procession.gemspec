# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "procession/version"

Gem::Specification.new do |s|
  s.name        = "procession"
  s.version     = Procession::VERSION
  s.authors     = ["Cedric Sohrauer"]
  s.email       = ["sohrauer@googlemail.com"]
  s.homepage    = ""
  s.summary     = %q{A Simple Commandline-Progessbar}
  s.description = %q{A Simple CommandLine-Progressbar}

  s.rubyforge_project = "procession"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
