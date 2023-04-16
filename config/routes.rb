Rails.application.routes.draw do
  get 'subjects/new'
  devise_for :users,
    controllers: { registrations: 'registrations' }

  root 'posts#index'

  get '/users/:id', to: 'users#show', as: 'user'
  get '/subjects', to: 'subjects#index', as: 'subjects'
  get '/posts/search', to: 'posts#search', as: 'posts_search'

  resources :posts, only: %i(index new create show destroy) do
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end