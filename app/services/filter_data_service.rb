class FilterDataService
  attr_accessor :timestamp, :load_data

  def initialize(timestamp, load_data)
    @timestamp = timestamp
    @load_data = load_data
  end

  def call
    filter_record(timestamp, load_data)
  end

  def filter_record(timestamp, load_data)
    filtered_data = load_data["records"].map {|data| data if DateTime.parse(data["createdTime"]) >= DateTime.parse(Time.at(timestamp.to_i).to_s)}.compact
    if !filtered_data.empty?
      filtered_data.join(",")
    else
      'No record found'
    end
  end
end