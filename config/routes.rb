Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  get '/signup', to: 'users#new'

  # The following could be expressed more simply as:
  #
  #   get 'static_pages/help'
  #   get 'static_pages/about'
  #   get 'static_pages/contact'
  #
  # The form below merely creates routes with shorter names, such as
  # 'home_path' and 'home_uri', which can lead to more concise use in ERB
  # templates.

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :users
end
