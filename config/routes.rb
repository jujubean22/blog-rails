Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'articles#index'

namespace :api do 
  get '/today_quote' => 'quotes#index'
end
  resources :articles do
    resources :comments
  end
end

  # get '/articles/index'  =>  '/articles#index'
  # get '/articles' => 'articles#index'

  # get '/articles/new' => 'articles#new'
  # post "/articles" => "articles#create"

  # get '/articles/:id/edit' => 'articles#edit'
  # get '/articles/:id' => 'articles#show'
