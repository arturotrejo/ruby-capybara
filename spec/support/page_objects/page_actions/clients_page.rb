include ClientsElements

module ClientsPage

  # Search for a user in the client list using the provided text and search type.
  # @example
  #   search_user_in_clients('John Doe', SEARCH_TYPE[:clients])
  # @param text [String] The text to search for. It can be client name or phone.
  # @param client_status [String] The type of user. Eg: Clients, Contacts, etc...
  def search_user_in_clients(text, client_status)
    fill_in search_client_field, with: text

    click_button client_status_label
    wait_for_element client_status_options
    within(client_status_options) do
      check client_status
      click_button apply_label
    end
  end
end