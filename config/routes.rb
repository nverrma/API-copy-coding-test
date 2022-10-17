Rails.application.routes.draw do

  get "/contacts", to: "contact_options#contacts"
  get "/contact_rankings", to: "contact_options#show_contacts_ranking"

  get "/copy", to: "copies#copy"
  get "/copy/refresh", to: "copies#refresh"
  get "/copy/*key", to: "copies#fetch_key_data", only: [:fetch_key_data]
end
