class ApplicationController < ActionController::API
  before_action :fetch_key_data_error_handler, only: [:fetch_key_data]

  def response_format(data)
    { value: data }
  end

  def fetch_key_data_error_handler
    unless condition
      render json: message, status: :unprocessable_entity
    end
  end

  def condition
    params[:key] == 'greeting' || params[:key] == 'greetingVIP' || params[:key] == 'intro' || params[:key] == 'time'
  end

  def message
    {
      'error': 'Please enter valid key like `greeting`, `greetingVIP`, `intro.created_at`, `intro.updated_at`, `time`'
    }
  end
end
