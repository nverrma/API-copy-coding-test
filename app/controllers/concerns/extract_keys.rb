module ExtractKeys
  extend ActiveSupport::Concern

  def key_extractor(hsh, match_record, params)
    keys = match_record.scan(/\{(.*?)\}/).flatten
    keys.each do |key|
      hsh[key.to_sym] = key.split(', ').map{|sk| ReplaceAttrService.new(match_record(sk) || params[sk], nil, params).call unless sk == 'datetime' }.join(',')
    end
  end
end