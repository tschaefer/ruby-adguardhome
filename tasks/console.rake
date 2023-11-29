# frozen_string_literal: true

ROOT = "#{File.dirname(__FILE__)}/..".freeze

$LOAD_PATH.unshift "#{ROOT}/lib"

def silent
  original_stdout = $stdout.clone
  original_stderr = $stderr.clone
  $stderr.reopen File.new(File::NULL, 'w')
  $stdout.reopen File.new(File::NULL, 'w')
  yield
ensure
  $stdout.reopen original_stdout
  $stderr.reopen original_stderr
end

def reload!(print: true)
  puts 'Reloading...' if print
  dirs = %w[lib]
  dirs.each do |dir|
    Dir.glob("#{ROOT}/#{dir}/**/*.rb").each { |f| silent { load(f) } }
  end

  true
end

desc 'Start a console session with Adguard loaded'
task :console do
  require 'pry'
  require 'pry-byebug'
  require 'pry-doc'
  require 'pry-theme'
  require 'adguard_home'

  ARGV.clear

  Pry.start
end
