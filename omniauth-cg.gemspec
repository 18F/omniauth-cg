# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-cg/version'

Gem::Specification.new do |gem|
  gem.name = 'omniauth-cg'
  gem.version = Omniauth::Cg::VERSION
  gem.authors = ['Greg Gershman', 'Christopher Papazian', 'Robb Shecter']
  gem.email = ['robb.shecter@gsa.gov']
  gem.description = 'OmniAuth strategy for Cloud.gov.'
  gem.summary = 'OmniAuth strategy for Cloud.gov.'
  gem.homepage = 'https://github.com/18F/omniauth-cg'

  gem.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'omniauth', '~> 1.0'
  # oauth2 gem locked hard at pre-1.4.0 because 1.4.0 breaks.
  # See comments on https://github.com/intridea/omniauth-oauth2/commit/26152673224aca5c3e918bcc83075dbb0659717f
  gem.add_dependency 'omniauth-oauth2', '1.3.1'
end
