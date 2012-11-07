Atcpg::Application.routes.draw do
  resources :atccodes
  root :to => 'atccodes#index'
end
