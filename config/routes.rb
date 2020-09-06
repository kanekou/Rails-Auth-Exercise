Rails.application.routes.draw do
  get 'login/login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api, defaults: { format: :json } do
    resources :users
    resources :memos
    post 'login/login'
  end
end