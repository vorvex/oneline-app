Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :login
    get 'signup' => 'devise/registrations#new'
  end 
    root 'dashboard#index'
    get 'bearbeiten' => 'dashboard#company', as: :company
    post 'unternehmen_erstellen' => 'dashboard#create_company', as: :create_company
    
    get 'datenverarbeitung' => 'dashboard#datenverarbeitung'
  
    resources :dashboard, only: [:index, :datenverarbeitung] do
    resource :download, only: [:datenverarbeitung]
  end
end
