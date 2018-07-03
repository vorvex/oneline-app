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
  
  # Website Builder
  
  get 'webseite' => 'website_builder#index', as: :website_builder
  get 'webseite/neu' => 'website_builder#new_website', as: :new_website
  post 'webseite/erstellen' => 'website_builder#create_website', as: :create_website
  get 'webseite/bearbeiten' => 'website_builder#edit_website', as: :edit_website
  patch 'website/aktualisieren' => 'website_builder#update_website', as: :update_website
  
  get 'webseite/einstellungen' => 'website_builder#website_settings', as: :website_settings
  post 'webseite/einstellungen/aktualisieren' => 'website_builder#create_settings'
  patch 'webseite/einstellungen/aktualisieren' => 'website_builder#update_settings'
  
  get 'webseite/seite/anzeigen/:id' => 'website_builder#show_page', as: :page
  get 'webseite/seite/neu' => 'website_builder#new_page', as: :new_page
  post 'webseite/seite/erstellen' => 'website_builder#create_page', as: :create_page
  get 'webseite/seite/bearbeiten/:id' => 'website_builder#edit_page', as: :edit_page
  patch 'webseite/seite/aktualisieren/:id' => 'website_builder#update_page', as: :update_page
  delete 'webseite/seite/löschen/:id' => 'website_builder#destroy_page', as: :destroy_page
  
  get 'webseite/:page_id/abschnitt/neu' => 'website_builder#new_section', as: :new_section
  post 'webseite/:page_id/abschnitt/erstellen' => 'website_builder#create_section', as: :create_section
  get 'webseite/abschnitt/bearbeiten/:id' => 'website_builder#edit_section', as: :edit_section
  patch 'webseite/abschnitt/aktualisieren/:id' => 'website_builder#update_section', as: :update_section
  delete 'webseite/abschnitt/löschen/:id' => 'website_builder#destroy_section', as: :destroy_section
  
  
  # Website
  
  get 'website/:url' => 'website#index', as: :index
  get 'website/:url/:name' => 'website#page', as: :sub_page
end
