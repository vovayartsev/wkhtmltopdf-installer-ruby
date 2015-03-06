require_relative 'wkhtmltopdf_installer/version'

module WkhtmltopdfInstaller
  extend self

  def libexec_dir
    "#{File.dirname(__FILE__)}/../libexec"
  end

  def wkhtmltopdf_path
    "#{libexec_dir}/wkhtmltopdf"
  end
end

ENV['PATH'] = [WkhtmltopdfInstaller.libexec_dir, ENV['PATH']].compact.join(':')

