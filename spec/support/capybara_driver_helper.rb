# Load Capybara and drivers
require 'capybara/rspec'
require 'selenium-webdriver'

case ENV['DRIVER']
when 'chrome'
  Capybara.default_driver = :selenium_chrome
when 'chrome_headless'
  Capybara.default_driver = :selenium_chrome_headless
else
  Capybara.default_driver = :selenium_chrome_headless
end

Capybara.page.driver.browser.manage.window.maximize
Capybara.app_host = ENV['URL']
