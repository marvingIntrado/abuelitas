Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :appointments, only: [:index, :show, :edit, :update, :destroy]
  resources :experiences do
    resources :appointments, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  # Define the custom root for my experiences
  get 'my-experiences', to: 'experiences#my_index'
  get 'my_experiences/:id', to: 'experiences#my_experience'
end
