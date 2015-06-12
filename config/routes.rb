Rails.application.routes.draw do

  root 'welcome#index'
  get '/thanks', to: 'welcome#thanks'
  get '/about', to: 'welcome#about'
  get '/coffee', to: 'welcome#coffee'
  get '/shop', to: 'welcome#shop'
  get '/blog', to: 'welcome#blog'
  get '/finca_jaramillo', to: 'coffees#finca_jaramillo'
  get '/finca_fernandez', to: 'coffees#finca_fernandez'
  get '/elida_estates', to: 'coffees#elida_estates'
  get 'finca_deborah', to: 'coffees#finca_deborah'
  get 'blog/panama_coffeeshops', to: 'posts#panama_coffeeshops'
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :clients
    # get "login"    => "sessions#new",         :as => "login"
    # post "logout"  => "sessions#destroy",     :as => "logout"
    # get "signup"   => "users#new",            :as => "signup"
  end
end
