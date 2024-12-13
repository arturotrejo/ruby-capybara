include Enums
include SidePanelElements

module HomePage

  # Creates a new client using the provided client data and location.
  # @example
  #   client_data = { first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', phone: '123-456-7890' }
  #   create_client(client_data, LOCATION[:video_office])
  # @param client_data [Hash] A hash containing the client details. Use #generate_client_data for convenience.
  # @param location [String] The location of the client (defaults to "Video Office").
  def create_client(client_data, location = LOCATION[:video_office])
    click_button create_label
    click_button create_client_label
    wait_for_element side_panel_title, text = create_client_label

    fill_new_client_form client_data[:first_name], client_data[:last_name], client_data[:email], client_data[:phone], location
    click_button continue_label

    unless client_data[:email].nil?
      complete_client_intakes
    end
  end

  # Fills out the new client form with the provided client details. Email and Phone are optional
  # @example
  #   fill_new_client_form('John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Video Office')
  # @param first_name [String] The first name of the client.
  # @param last_name [String] The last name of the client.
  # @param email [String, nil] The email address of the client.
  # @param phone [String, nil] The phone number of the client.
  # @param location [String] The location of the client.
  def fill_new_client_form(first_name, last_name, email, phone, location)
    fill_in first_name_field, with: first_name
    fill_in last_name_field, with: last_name

    [[email_field, email], [phone_field, phone]].each do |field, value|
      unless value.nil?
        click_button "Add #{field}"
        fill_in field, with: value
      end
    end
    select location, from: client_location_dropdown
  end

  # Completes the client intake process by navigating through the forms.
  def complete_client_intakes
    click_button continue_to_email_label
    click_button continue_to_review_label
    click_button share_and_send_now_label
  end

end
