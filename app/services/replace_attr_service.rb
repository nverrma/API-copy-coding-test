class ReplaceAttrService
  attr_accessor :str, :val_hsh, :params

  def initialize(str, val_hsh, params)
    @str = str
    @val_hsh = val_hsh
    @params = params
  end

  def call
    replace_attribute(str, val_hsh)
  end

  def replace_attribute(str, val_hsh)
    new_str = str.gsub('{', '%{')

    unless val_hsh.nil?
      res_str = (new_str % val_hsh).chomp.split(' ').uniq.join(" ").sub(',', '')
      timestamp = res_str.scan(/\d/).join('')
      res_str = date_formated_str(res_str, timestamp) unless timestamp.blank?
      return res_str
    end
    return new_str % params.as_json.map{|k,v| [k.to_sym, v]}.to_h if val_hsh.nil?
  end

  def date_formated_str(result, timestamp)
    str = Time.at(timestamp.to_i).strftime("%a %b %d %I:%M:%S%p")
    result = result.gsub(timestamp, str)
  end
end