Rc9::Application.routes.draw do
  resources :peeps do
    collection do
      get 'find_by_email'
    end
  end
  resources :users
  resource :account, :controller => "users"
  resource :print, :controller => "print" do
    member do
      get :attendees
      get :lanyards
    end
  end
  resource :user_session
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => "user_sessions#new"
end
