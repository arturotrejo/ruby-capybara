require 'faker'

include ClientsElements
include LoginElements
include HomeElements

module Helpers

  # Generates random client data, including name, email, and phone, with optional email and phone.
  # @example
  #   client_data = generate_client_data(generate_email: true, generate_phone: false)
  # @param generate_email [Boolean] Whether to generate an email address for the client (defaults to true).
  # @param generate_phone [Boolean] Whether to generate a phone number for the client (defaults to true).
  # @return [Hash] A hash containing the generated client data, including full_name, first_name, last_name, email, and phone.
  def generate_client_data(generate_email: true, generate_phone: true)
    unique_id = SecureRandom.alphanumeric(4)
    first_name = Faker::Name.first_name + unique_id
    last_name = Faker::Name.last_name + unique_id
    full_name = first_name + ' ' + last_name
    email = generate_email ? Faker::Internet.email(name: full_name) : nil
    phone = generate_phone ? Faker::PhoneNumber.cell_phone : nil

    { full_name: full_name, first_name: first_name, last_name: last_name, email: email, phone: phone }
  end

  # Logs in a user using the provided email and password.
  # @param email_address [String] The email address of the user to log in.
  # @param password [String] The password of the user to log in.
  def login(email_address = ENV['LOGIN_EMAIL'], password= ENV['LOGIN_PASSWORD'])
    visit('/')
    fill_in login_email_field, with: email_address
    fill_in login_password_field, with: password
    click_button sign_in_button

    wait_for_element user_profile_button
    close_consent_manager_message
  end

  # Close the Consent Manager message if it's displayed
  def close_consent_manager_message
    if page.has_selector?(close_consent_manager_button)
      find(close_consent_manager_button).click
    end
  end

  # Navigates to a specific page by clicking the corresponding option in the navigation bar.
  # @example
  #   go_to_page(PAGE[:clients])
  # @param page_name [String] The name of the navigation bar option.
  def go_to_page(page_name)
    find(nav_bar_option(page_name)).click
  end

  # Waits for an element to appear on the page within 5 seconds. If text is provided it will check for a text match as well.
  # @example
  #   wait_for_element('.submit-button', text: 'Submit')
  # @param selector [String] The selector of the element to wait for.
  # @param text [String, nil] Optional text that the element should contain (defaults to nil).
  # @raise [Capybara::ElementNotFound] Raises an error if the element is not found within 5 seconds.
  def wait_for_element(selector, text = nil)
    text_error_message = text.nil? ? '' : "with text '#{text}'"
    unless page.has_selector?(selector, text: text, visible: true, wait: 5)
      raise Capybara::ElementNotFound, "Element '#{selector}' #{text_error_message} not found within 5 seconds"
    end
  end

end