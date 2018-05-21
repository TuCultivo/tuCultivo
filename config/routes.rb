Rails.application.routes.draw do
  devise_for :users
  
  resources :farms do
    resources :lots do 
      resources :grooves do 
        post 'plague_reports/find', to: 'plague_reports#find_reports', as: 'find'
        resources :plague_reports 
      end
    end  
  end

  post '/grooves/:groofe_id/reports', to: 'plague_reports#create'

  # resources :nodes do
  #   resources :sensors
  #   delete "/sensors/:id", to: "sensors#destroy", as:"delete_sensor"
  #   post "/sensors", to: "sensors#create", as:"create_sensor"
   
  #   get '/sensors/:sensor_id/values', to: 'sensors#values', as: 'values'
  # end

  # post '/sensors/:id/values', to: 'sensors#create_value'
  root to: "farms#index"
end
