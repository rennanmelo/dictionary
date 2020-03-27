Rails.application.routes.draw do
  root 'words#index'
  get '/words/new' => 'words#new'
  post '/words' => 'words#create'
end
