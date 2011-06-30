VTranscoder::Application.routes.draw do
  #RESQUE
  mount Resque::Server, :at => "/resque"
  
  #API
  match '/api/request_encode' => 'apis#request_encode', :as => :request_for_encode
  
  #Machines
  resources :machines
  match '/machines/:id/destroy' => 'machines#destroy', :as => :delete_machine

  #Jobs
  resources :jobs
  
end
