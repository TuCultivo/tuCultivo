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

  scope 'farms' do
    put '/:farm_id/lots/:id', to: 'lots#update' , as: 'update_farm_lot' 
    put '/:farm_id/lots/:lot_id/grooves/:id', to: 'grooves#update', as: 'update_farm_lot_groofe'
    get "/:id/summary", to: "farms#summary",as: 'summary'
  end

  post '/grooves/:groofe_id/reports', to: 'plague_reports#create'
  post '/plague_reports/',to: 'plague_reports#create'
  post '/lots/:id/get_info',to: 'lots#get_info', as: 'get_lot_info'
  
  # resources :nodes do
  #   resources :sensors
  #   delete "/sensors/:id", to: "sensors#destroy", as:"delete_sensor"
  #   post "/sensors", to: "sensors#create", as:"create_sensor"
   
  #   get '/sensors/:sensor_id/values', to: 'sensors#values', as: 'values'
  # end

  # post '/sensors/:id/values', to: 'sensors#create_value'
  root to: "farms#index"
end
