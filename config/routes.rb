Rails.application.routes.draw do

  get "/copy", to: "copies#copy"
  get "/copy/refresh", to: "copies#refresh"
  get "/copy/*key", to: "copies#fetch_key_data", only: [:fetch_key_data]
end
