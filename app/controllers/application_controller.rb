class ApplicationController < ActionController::API
  def response_format(data)
    { value: data }
  end
end
