include ClientsElements

module ClientsPage

  # Search for a user in the client list using the provided text and search type.
  # @example
  #   search_user_in_clients('John Doe', SEARCH_TYPE[:clients])
  # @param text [String] The text to search for. It can be client name or phone.
  # @param user_type [String] The type of user. Eg: Clients, Contacts, etc...
  def search_user_in_clients(text, user_type)
    fill_in search_client_field, with: text

    find(search_type_dropdown).click
    wait_for_element user_type_options
    within(user_type_options) do
      click_button user_type
    end
  end

end