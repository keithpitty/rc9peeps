Rc9::Application.routes.draw do
  resources :peeps do
    collection do
      get 'find_by_email'
    end
  end
  root :to => "peeps#index"
end
