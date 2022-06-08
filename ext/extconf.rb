# frozen_string_literal: true

require 'mkmf'
require 'tmpdir'
require 'ostruct'
require_relative '../lib/wkhtmltopdf_installer'

def probe
  @probe ||= case RUBY_PLATFORM
             when /darwin.*/ # both M1 ARM and x86 are supported for macos
               OpenStruct.new(script: 'macos', platform: 'macos_cocoa', ext: 'pkg')
             when /x86_64-linux/
               OpenStruct.new(script: 'linux', platform: 'linux_amd64', ext: 'deb')
             when /aarch64-linux/
               OpenStruct.new(script: 'linux', platform: 'linux_arm64', ext: 'deb')
             when /i[3456]86-linux/
               OpenStruct.new(script: 'linux', platform: 'linux_i386', ext: 'deb')
             else
               raise NotImplementedError, "Unsupported ruby platform #{RUBY_PLATFORM}"
             end
end

def version
  WkhtmltopdfInstaller::BINARIES_VERSION
end

def makefile_dir
  File.dirname(__FILE__)
end

# Some examples:
# "https://github.com/vovayartsev/wkhtmltopdf-installer-ruby/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.linux_amd64.deb"
# "https://github.com/vovayartsev/wkhtmltopdf-installer-ruby/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.linux_i386.deb"
# "https://github.com/vovayartsev/wkhtmltopdf-installer-ruby/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.macos_cocoa.pkg"

def package_url
  "https://github.com/vovayartsev/wkhtmltopdf-installer-ruby/releases/download/#{version}/wkhtmltox-#{version}.#{probe.platform}.#{probe.ext}"
end

# The main Makefile contains settings only. The actual work is done by os-specific Makefile.xxxxx files
File.write "#{makefile_dir}/Makefile", <<-EOF
URL = #{package_url}
LIBEXEC = #{WkhtmltopdfInstaller.libexec_dir}
TARGET = #{WkhtmltopdfInstaller.wkhtmltopdf_path}
TMPDIR = #{Dir.mktmpdir}
all: unpack
install: copy clean
include Makefile.#{probe.script}
include Makefile.common
EOF
