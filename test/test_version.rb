require 'open-uri'
require 'wkhtmltopdf_installer'

OPEN_URI_OPTIONS = begin
  require 'open_uri_redirections'
  {:allow_redirections => :all}
rescue LoadError
  {}
end

OFFICIAL_DOWNLOADS_PAGE = 'https://wkhtmltopdf.org/downloads.html'

def up_to_date?
  content = open(OFFICIAL_DOWNLOADS_PAGE, OPEN_URI_OPTIONS) { |f| f.read }
  if content =~ %r{The current stable series is <strong>([\d\.]+)</strong>}
    $1 == WkhtmltopdfInstaller::VERSION
  else
    raise "Could not deduce the current stable version from #{OFFICIAL_DOWNLOADS_PAGE}"
  end
end

unless up_to_date?
  puts "Looks like update issued!"
  exit 1
end
