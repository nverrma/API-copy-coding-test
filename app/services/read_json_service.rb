class ReadJsonService
  def call
    file_data = File.open("public/copy.json").read
    JSON.parse(file_data)
  end
end