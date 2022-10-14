class CopiesController < ApplicationController
  include ParamsHandler
  before_action :load_data, except: [:refresh]

  def copy
      render json: load_data, status: 200
  end

  def fetch_key_data
    params_handler(params)
    match_record = match_record(params['key'])
    keys = match_record.scan(/\{(.*?)\}/).flatten
    hsh = {}
    keys.each do |key|
      hsh[key.to_sym] = key.split(', ').map{|sk| ReplaceAttrService.new(match_record(sk) || params[sk], nil, params).call unless sk == 'datetime' }.join(',')
    end

    response = ReplaceAttrService.new(match_record, hsh, params).call
    render json: response_format(response), status: 200
  end

  def refresh
    RefreshDataService.call
    render json: 'Successfully updated json data', status: 200
  end

  private

  def load_data
    ReadJsonService.new.call
  end

  def match_record(key)
    load_data["records"].collect{|data| data['fields']['copy'] if data["fields"]['key'] == key}.compact.first
  end
end