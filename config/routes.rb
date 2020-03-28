Rails.application.routes.draw do
  root 'words#index'
  get '/words' => 'words#index'
  get '/words/new' => 'words#new'
  post '/words' => 'words#create'
  get '/words/:id' => 'words#show', as: 'word'
end
