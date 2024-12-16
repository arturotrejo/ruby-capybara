require 'capybara/rspec'
require 'selenium-webdriver'

# Registers a new Chrome driver with the specified arguments.
# @param driver_name [Symbol] The name of the new driver
# @param driver_arguments [Array<String>] The list of argument options for the Chrome browser.
def register_chrome_driver(driver_name, driver_arguments = [])
  Capybara.register_driver driver_name do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    driver_arguments.each do |argument|
      options.add_argument(argument)
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end

case ENV['DRIVER']
when 'chrome'
  Capybara.default_driver = :selenium_chrome
when 'chrome_headless'
  Capybara.default_driver = :selenium_chrome_headless
when 'docker_chrome_headless'
  driver_arguments = %w[--headless --disable-gpu --no-sandbox --disable-dev-shm-usage --window-size=1920,1080]
  register_chrome_driver :docker_chrome_headless, driver_arguments
  Capybara.default_driver = :docker_chrome_headless
else
  Capybara.default_driver = :selenium_chrome_headless
end

unless ENV['DRIVER'] == 'docker_chrome_headless'
  Capybara.page.driver.browser.manage.window.maximize
end
Capybara.app_host = ENV['URL']
