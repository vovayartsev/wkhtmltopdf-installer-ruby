# wkhtmltopdf-installer-ruby
Downloads and installs wkhtmltopdf from the official website

## Usage

```bash
  gem install wkhtmltopdf-installer
```

Then in your Ruby script

```ruby
  require 'wkhtmltopdf_installer'
  system WkhtmltopdfInstaller.wkhtmltopdf_path

  # this also works, because ENV['PATH'] is adjusted
  system 'wkhtmltopdf'
```

The gem also provides a shim, so that it works in the shell too.

## Contribution
Pull requests are very welcome.
Pull requests with updates in version.rb are welcome too.
