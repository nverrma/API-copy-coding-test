class CopiesController < ApplicationController
  include ParamsHandler
  include ExtractKeys
  # before_action :validate_params
  before_action :load_data, except: [:refresh]

  def copy
    if params[:since].present?
      response = FilterDataService.new(params[:since], load_data).call
      render json: response
    else
      render json: load_data, status: 200
    end
  end

  def fetch_key_data
    begin
      params_handler(params)
      match_record = match_record(params['key'])
      hsh = {}
      key_extractor(hsh, match_record, params)

      response = ReplaceAttrService.new(match_record, hsh, params).call
      render json: response_format(response), status: 200
    rescue => exception
      render json: { 'error_message': "please send valid params #{params[:format]} data" }, status: :unprocessable_entity
    end
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