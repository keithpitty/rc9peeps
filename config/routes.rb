Rc9::Application.routes.draw do
  resources :peeps
  root :to => "peeps#index"
end
