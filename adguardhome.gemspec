# frozen_string_literal: true

$LOAD_PATH << File.expand_path('lib', __dir__)
require 'adguardhome/version'

Gem::Specification.new do |spec|
  spec.name        = 'adguardhome'
  spec.version     = AdGuardHome::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Tobias Schäfer']
  spec.email       = ['github@blackox.org']

  spec.summary     = 'AdGuardHome client.'
  spec.description = <<~DESC
    #{spec.summary}
  DESC
  spec.homepage    = 'https://github.com/tschaefer/ruby-adguardhome'
  spec.license     = 'MIT'

  spec.files                 = Dir['lib/**/*']
  spec.bindir                = 'bin'
  spec.executables           = ['adguardhomectl']
  spec.require_paths         = ['lib']
  spec.required_ruby_version = '>= 3.1'

  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.metadata['source_code_uri']       = 'https://github.com/tschaefer/ruby-adguardhome'
  spec.metadata['bug_tracker_uri']       = 'https://github.com/tschaefer/ruby-adguardhome/issues'

  spec.post_install_message = 'All your AdGuardHome are belong to us!'

  spec.add_dependency 'clamp', '~> 1.3.2'
  spec.add_dependency 'httparty', '~> 0.21.0'
  spec.add_dependency 'pastel', '~> 0.8.0'
  spec.add_dependency 'tty-pager', '~> 0.14.0'
  spec.add_dependency 'tty-table', '~> 0.12.0'
end
