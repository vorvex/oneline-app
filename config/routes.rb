Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/new_user'
  mount Ckeditor::Engine => '/ckeditor'
  
  get 'settings/company'
  get 'download/datenschuty'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :login
    get 'signup' => 'devise/registrations#new'
  end 
    root 'dashboard#index'
    
    # Downloads
    
    get 'downloads' => 'download#index'
    get 'download/:name' => 'download#formular', as: :formular
  
    # Settings
    get 'einstellungen' => 'settings#edit_company'
    get 'einstellungen/neu' => 'settings#company', as: :company
    post 'einstellungen/unternehmen_erstellen' => 'settings#create_company', as: :create_company
    get 'einstellungen/unternehmen_bearbeiten' => 'settings#edit_company', as: :edit_company
    patch 'einstellungen/unternehmen_update' => 'settings#update_company', as: :update_company
  
    get 'neues_passwort' => 'settings#new_password', as: :new_password
    patch 'neues_passwort' => 'settings#create_password', as: :create_password
  
  
    # Formular Creator
  
    get 'formular/editor' => 'formular_creator#index', as: :formular_index
    get 'formular/editor/new' => 'formular_creator#new', as: :formular_new
    post 'formular/editor/create' => 'formular_creator#create', as: :formular_create
    get 'formular/editor/edit/:id' => 'formular_creator#edit', as: :formular_edit
    patch 'formular/editor/edit/:id' => 'formular_creator#update', as: :formular_update
    delete 'formular/editor/delete/:id' => 'formular_creator#destroy', as: :formular_destroy
  
    # Admin Dashboard
  
    get 'admin' => 'admin#index', as: :admin
    get 'admin/neuer_nutzer' => 'admin#new_user', as: :new_user
    post 'admin/nutzer_erstellen' => 'admin#create_user', as: :create_user
  
    resources :dashboard, only: [:index, :datenverarbeitung] do
    resource :download, only: [:datenverarbeitung]
  end
end
