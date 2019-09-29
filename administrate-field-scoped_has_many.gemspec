lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'administrate/field/scoped_has_many/version'

Gem::Specification.new do |spec|
  spec.name          = 'administrate-field-scoped_has_many'
  spec.version       = Administrate::Field::ScopedHasManyVersion::VERSION
  spec.authors       = ['Derk-Jan Karrenbeld']
  spec.email         = ['derk-jan@xpbytes.com']

  spec.summary       = 'A has_many field that yields itself to the scope option'
  spec.homepage      = 'https://github.com/XPBytes/administrate-field-scoped_has_many'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = 'TODO: Set to 'http://mygemserver.com''

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = spec.homepage
    spec.metadata['changelog_uri'] = spec.homepage + '/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'administrate', '>= 0.11.0', '< 1'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rake', '~> 13.0'
end
