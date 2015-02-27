Gem::Specification.new do |s|
  s.name        = 'wkhtmltopdf-installer'
  s.version     = '0.12.2.1'
  s.date        = '2015-01-19'
  s.summary     = "Light-weight cross-platform wkhtmltopdf binary installer"
  s.description = "Downloads wkhtmltopdf binary during 'Building native extension...' phase"
  s.authors     = ["Vladimir Yartsev"]
  s.email       = 'vovayartsev@gmail.com'
  s.files       = Dir.glob ['ext/*.rb', 'ext/Makefile.*']
  s.extensions  = ["ext/extconf.rb"]
  s.homepage    = 'http://rubygems.org/gems/wkhtmltopdf-installer'
  s.license     = 'MIT'
end
