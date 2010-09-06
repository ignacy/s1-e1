require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "swiergot"
    gemspec.summary = "swiergot is a twitter bot sending updates from lokter.pl new site"
    gemspec.email = "imoryc@gmail.com"
    gemspec.homepage = "http://github.com/ignacy/s1-e1"
    gemspec.authors = ["Ignacy Moryc"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

############################

require 'spec/rake/spectask'

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['test/*_spec.rb']
end

task :default => :spec
