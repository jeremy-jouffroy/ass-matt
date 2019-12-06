Rails.application.routes.draw do
  devise_for :users
  # homepage default
  root to: 'pages#home'
  # resources :pages

  resources :salaries, only: [:index, :show, :new, :create, :edit, :update] do
    resources :pay_slips do
      resources :days
    end
  end
end
