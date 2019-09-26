Rails.application.routes.draw do
  post 'teams/', to: 'teams#new'
  post 'auth/login'
  post 'auth/logout'
  post 'auth/oauth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
