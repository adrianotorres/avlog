Rails.application.routes.draw do
  # resources :estoques
  resources :produtos
  resources :setores

  get 'aquisicao' => 'estoques#aquisicao'
  post 'adquirir' => 'estoques#adquirir'
  get 'solicitar_produto' => 'solicitar_produto#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "setores#index"
end
