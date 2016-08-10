Rails.application.routes.draw do
  # devise_for :usuarios
  devise_for :usuarios, controllers: {
    sessions: 'usuarios/sessions'
  }



  # resources :estoques
  resources :produtos do
    collection do
      get :solicitacao, on: :new
    end
    member do
      post :solicitacao
    end
  end

  resources :setores

  get 'aquisicao' => 'estoques#aquisicao'
  post 'adquirir' => 'estoques#adquirir'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "setores#index"
end
