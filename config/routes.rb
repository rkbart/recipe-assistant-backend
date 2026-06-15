Rails.application.routes.draw do
  namespace :api do
    resources :recipe_documents, only: [:create, :index, :show]
    post "chat", to: "chat#create"
  end
end
