Rails.application.routes.draw do
  resources :posts
  root 'posts#index'

  # to link tags to posts with the respective tag
  get 'tags/:tag', to: 'posts#index', as: :tag
end
