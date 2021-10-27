require 'mkmf'
require 'tmpdir'
require 'ostruct'
require_relative '../lib/wkhtmltopdf_installer'

def probe
  @probe ||= case RUBY_PLATFORM
               when /-darwin.*/
                 OpenStruct.new(script: 'macos', platform: 'macos-cocoa', ext: 'pkg', release: 2)
               when /x86_64-linux/
                 OpenStruct.new(script: 'linux', platform: 'stretch_amd64', ext: 'deb', release: 1)
               when /i[3456]86-linux/
                 OpenStruct.new(script: 'linux', platform: 'stretch_i386', ext: 'deb', release: 1)
               else
                 raise StandardError, "Unsupported ruby platform: #{RUBY_PLATFORM}"
             end
end



# https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.stretch_amd64.deb
# https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.stretch_i386.deb
# https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-2/wkhtmltox_0.12.6-2.macos-cocoa.pkg
def package_url
  version = WkhtmltopdfInstaller::VERSION
  version = "#{version}-#{probe.release}"
  filename = "wkhtmltox-#{version}.#{probe.platform}.#{probe.ext}"

  "https://github.com/wkhtmltopdf/packaging/releases/download/#{version}/#{filename}"
end

# The main Makefile contains settings only. The actual work is done by os-specific Makefile.xxxxx files
File.write "#{File.dirname(__FILE__)}/Makefile", <<-EOF
URL = #{package_url}
LIBEXEC = #{WkhtmltopdfInstaller.libexec_dir}
TARGET = #{WkhtmltopdfInstaller.wkhtmltopdf_path}
TMPDIR = #{Dir.mktmpdir}
all: unpack
install: copy clean
include Makefile.#{probe.script}
include Makefile.common
EOF

