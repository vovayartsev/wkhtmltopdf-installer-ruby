# wkhtmltopdf-installer-ruby
[![Build Status](https://semaphoreci.com/api/v1/projects/cff505e1-aa02-441e-8b7f-df4cc1342939/367628/badge.png)](https://semaphoreci.com/vovayartsev/wkhtmltopdf-installer-ruby)

Downloads and installs wkhtmltopdf from the official website

**This is Avant's fork to use version 0.12.2.1.3 with the new downloads provider**

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
