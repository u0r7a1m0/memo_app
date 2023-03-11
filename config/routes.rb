Rails.application.routes.draw do
  root to: "memos#index"
  resources :memos
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
