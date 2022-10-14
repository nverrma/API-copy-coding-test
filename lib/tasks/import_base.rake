require 'httparty'

namespace :import do
  task :json_data do
    require './app/services/refresh_data_service.rb'
    RefreshDataService.call
  end
end
