require_relative 'wkhtmltopdf_installer/version'

module WkhtmltopdfInstaller
  extend self

  def ext_dir
    "#{File.dirname(__FILE__)}/../ext"
  end

  def binary_full_path
    "#{ext_dir}/wkhtmltopdf"
  end
end

# ... so that system('wkhtmltopdf') just works
ENV['PATH'] = WkhtmltopdfInstaller.ext_dir + ':' + ENV['PATH']