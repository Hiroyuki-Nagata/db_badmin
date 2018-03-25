require 'rake'
require 'hanami/rake_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
  t.warning = false
end

task default: :test
task spec: :test

# task for testing
desc "Run webpack for build"
task :run_webpack do
  sh "yarn && yarn run webpack"
end

desc "Run app server for testing"
task :run_server do
  sh "bundle exec hanami server"
end

desc "Run webpack & run app server for testing"
task :build_run_server do
  sh "yarn && yarn run webpack"
  sh "bundle exec hanami server"
end
