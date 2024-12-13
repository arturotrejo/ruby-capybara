require 'dotenv'
Dotenv.load

require_relative '../spec/support/capybara_driver_helper'
require_relative '../spec/support/require_files'

RSpec.configure do |config|

  config.after(:each) do |example|
    if example.exception
      timestamp = Time.now.strftime('%Y%m%d_%H%M')
      screenshot_path = "screenshots/#{timestamp}_#{example.full_description}.png"
      Capybara.page.save_screenshot(screenshot_path)
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
