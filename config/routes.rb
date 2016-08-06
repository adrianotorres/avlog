Rails.application.routes.draw do
  resources :setores
  get 'solicitar_produto' => 'solicitar_produto#index'

  resources :produtos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "setores#index"
end
