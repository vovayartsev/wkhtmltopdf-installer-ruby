require 'mkmf'

platform = "macos"
dir = File.dirname(__FILE__)

File.write "#{dir}/Makefile", <<-EOF
all: unpack
install: copy clean
include Makefile.#{platform}
include Makefile.common
EOF

