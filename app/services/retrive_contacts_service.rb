class RetriveContactsService

  #if we want to update VIP offer read contact_option.json
  def contact_options_load
    file_data = File.open("public/contact.json").read
    JSON.parse(file_data)
  end
end