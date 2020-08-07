Rails.application.routes.draw do
  resources :projects do
    resources :similar, controller: :similar_projects, only: [:index]
  end

  resources :similar_projects, controller: :similar_projects, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
