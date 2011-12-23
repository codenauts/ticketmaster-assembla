require 'rubygems'
require 'rake'
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ticketmaster-assembla"
    gem.summary = %Q{The assembla provider for ticketmaster}
    gem.description = %Q{This provides an interface with assembla through the ticketmaster gem.}
    gem.email = "thomas@dohmke.de"
    gem.homepage = "http://github.com/codenauts/ticketmaster-assembla"
    gem.authors = ["HybridGroup", "Codenauts"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ticketmaster-assembla #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
