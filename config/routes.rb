Rails.application.routes.draw do

  # root "setores#index"

  resources :estoques
  resources :produtos
  resources :solicitacoes
  resources :setores

  # devise_for :usuarios
  devise_for :usuarios, controllers: {
    sessions: 'usuarios/sessions'
  }

  devise_scope :usuario do
    root to: "usuarios/sessions#new"
  end

end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
