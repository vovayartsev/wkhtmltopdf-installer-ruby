require 'open-uri'
require 'wkhtmltopdf_installer'

OFFICIAL_DOWNLOADS_PAGE = 'http://wkhtmltopdf.org/downloads.html'

def up_to_date?
  content = open(OFFICIAL_DOWNLOADS_PAGE) { |f| f.read }
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
