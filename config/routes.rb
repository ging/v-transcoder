VTranscoder::Application.routes.draw do
  mount Resque::Server, :at => "/resque"
  match '/api/request_encode' => 'apis#request_encode', :as => :request_for_encode
  resources :machines
  match '/machines/:id/destroy' => 'machines#destroy', :as => :delete_machine
end
