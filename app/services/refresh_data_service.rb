require 'rake'

class RefreshDataService
  def self.call
    uri = ENV["URI"]
    token = ENV["TOKEN"]

    response = HTTParty.get(uri, headers: {"Authorization": "#{token}"})

    File.open("public/copy.json","w") do |f|
      f.write(response.to_json)
    end
  end
end