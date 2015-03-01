require 'mkmf'
require 'tmpdir'
require_relative '../lib/wkhtmltopdf_installer/version'

def extraction_method
  'linux'
end

def version
  WkhtmltopdfInstaller::VERSION
end

def makefile_dir
  File.dirname(__FILE__)
end

def package_url
  # "http://downloads.sourceforge.net/project/wkhtmltopdf/#{version}/wkhtmltox-#{version}_osx-cocoa-x86-64.pkg"
  "http://downloads.sourceforge.net/project/wkhtmltopdf/#{version}/wkhtmltox-#{version}_linux-trusty-amd64.deb"
end

File.write "#{makefile_dir}/Makefile", <<-EOF
URL = #{package_url}
TARGET = wkhtmltopdf
TMPDIR = #{Dir.mktmpdir}
all: unpack
install: copy clean
include Makefile.#{extraction_method}
include Makefile.common
EOF

