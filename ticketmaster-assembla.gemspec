# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ticketmaster-assembla}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{HybridGroup}, %q{Codenauts}]
  s.date = %q{2011-12-23}
  s.description = %q{This provides an interface with assembla through the ticketmaster gem.}
  s.email = %q{thomas@dohmke.de}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md",
    "Rakefile",
    "lib/assembla/assembla-api.rb",
    "lib/provider/assembla.rb",
    "lib/provider/comment.rb",
    "lib/provider/project.rb",
    "lib/provider/ticket.rb",
    "lib/ticketmaster-assembla.rb"
  ]
  s.homepage = %q{http://github.com/codenauts/ticketmaster-assembla}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{The assembla provider for ticketmaster}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

