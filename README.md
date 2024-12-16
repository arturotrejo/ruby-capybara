# Ruby-Capybara UI Automation Framework:

This automation framework is based on Ruby using Capybara and RSpec. 

It's following a Page Object Model structure where you can find the locator elements and page actions 
in the [page_objects](spec/support/page_objects) folder. The test can be found in [features/client_creation_spec.rb](spec/features/client_creation_spec.rb).

## Getting Started
To run locally, first you need to have Ruby installed.

For Windows see: https://www.ruby-lang.org/en/documentation/installation/#winget or https://rubyinstaller.org/

For MacOS see: https://www.ruby-lang.org/en/documentation/installation/#homebrew

Once Ruby is installed clone the repository
```bash
  git clone https://github.com/arturotrejo/ruby-capybara
```

locate in the repository root folder and execute the following command to install all the required gems
```bash
  cd ruby-capybara
  bundle install
```
## Running Tests

### Environment Variables
To set the necessary environment variables, create a `.env` file in the repository root path and set the following variables:
- **DRIVER** - The webdriver you will use. You can choose between `chrome` and `chrome_headless`
- **LOGIN_EMAIL** - User email to log-in
- **LOGIN_PASSWORD** - User password
- **URL** - The URL you will be using. In this case we use https://secure.simplepractice.com

Once your .env file is ready, you can run the test
```bash
  rspec
```

**For Docker execution just run the image indicating user email and password. For example:**
```bash
  docker run -e LOGIN_EMAIL=user_email@example.com -e LOGIN_PASSWORD=user_password docker_image_name
```