require './spec/spec_helper'

include Helpers
include ClientsPage
include HomePage

RSpec.describe 'Client Creation', type: :feature do

  before(:each) do
    login
  end

  it 'creates a new client using the create button' do
    client_data = generate_client_data(generate_email: true, generate_phone: true)

    create_client client_data
    wait_for_element success_toast
    go_to_page PAGE[:clients]
    search_user_in_clients client_data[:full_name], SEARCH_TYPE[:clients_and_contacts]

    expect(page).to have_selector client_record_result, text: client_data[:full_name]
  end

end
