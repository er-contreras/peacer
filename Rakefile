# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
task default: %i[]

Rake::TestTask.new do |t|
  t.name = "test"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end
