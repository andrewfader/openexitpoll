require 'capybara-webkit'
Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
end
Capybara.javascript_driver = :webkit
Capybara.default_driver = :webkit
