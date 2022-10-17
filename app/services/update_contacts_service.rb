class UpdateContactsService
  attr_accessor :response

  def initialize(response)
    @response = response
  end

  def update_contact_options
    File.open("public/contact_option.json","w") do |f|
      f.write(response.to_json)
    end
  end
end