module ParamsHandler
  extend ActiveSupport::Concern

  def params_handler(params)
    params.merge!({:"format" => params[:key]}) if params[:key] == 'time'
    case params[:format]
    when 'created_at'
      params.merge!({:"created_at, datetime" => params[:created_at]})
      params[:key] = "intro.#{params[:format]}"
    when 'updated_at'
      params.merge!({:"updated_at, datetime" => params[:updated_at]})
      params[:key] = "intro.#{params[:format]}"
    when 'time'
      params.merge!({:"time, datetime" => params[:time]})
    end
  end
end