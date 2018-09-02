require_relative 'lib/wkhtmltopdf_installer/version'

Gem::Specification.new do |s|
  s.name        = 'wkhtmltopdf-installer'
  s.version     = WkhtmltopdfInstaller::GEM_VERSION
  s.date        = '2018-09-02'
  s.summary     = 'Light-weight cross-platform wkhtmltopdf binary installer'
  s.description = "Downloads wkhtmltopdf binary during 'Building native extension...' phase"
  s.authors     = ['Vladimir Yartsev']
  s.email       = 'vovayartsev@gmail.com'
  s.files       = Dir.glob ['ext/*.rb', 'ext/Makefile.*', 'lib/*.rb', 'lib/**/*.rb']
  s.extensions  = ['ext/extconf.rb']
  s.bindir      = 'bin'
  s.executables = %w(wkhtmltopdf)
  s.homepage    = 'http://rubygems.org/gems/wkhtmltopdf-installer'
  s.license     = 'MIT'
end
